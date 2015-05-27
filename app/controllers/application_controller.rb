class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  respond_to :html, :json
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  before_action :require_authentication_token, :require_login
  skip_before_filter :require_authentication_token, :require_login, if: :devise_controller?
  def current_user
    User.find_by(authentication_token: params[:authentication_token])
  end

  private
  def require_authentication_token
    unless params[:authentication_token]
      render json: {error: "Missing authentication token"}
    end
  end
  def require_login
    unless current_user 
      render json: {error: "User not authorized"}
    end
  end
end
