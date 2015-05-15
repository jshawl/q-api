class WelcomeController < ApplicationController
  skip_before_filter :require_authentication_token, :require_login
  def index
  end
end