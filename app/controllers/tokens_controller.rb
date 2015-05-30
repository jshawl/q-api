class TokensController < ApplicationController
  def index

  end
  def create
    @user = User.find(params[:user_id])
    @token = @user.tokens.create token_params
    render json: @token
  end

  private

  def token_params
    params.permit(:device_token)
  end
end