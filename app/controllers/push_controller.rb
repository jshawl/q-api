class PushController < ApplicationController
  skip_before_action :require_authentication_token, :require_login 
  def create
    apn = Houston::Client.development
    apn.certificate = File.read("#{Rails.root}/config/apple_push_notification.pem")

    # An example of the token sent back when a device registers for notifications
    token = params[:token]
    user = User.find(params[:user_id])
    task = Task.find(params[:task_id])
    user.tokens.each do |token|
      notification = Houston::Notification.new(device: token.device_token)
      notification.alert = "It's your turn to #{task.name}"
      apn.push(notification)
    end

    # Create a notification that alerts a message to the user, plays a sound, and sets the badge on the app

    # Notifications can also change the badge count, have a custom sound, have a category identifier, indicate available Newsstand content, or pass along arbitrary data.
    # notification.badge = 0
    # notification.category = "INVITE_CATEGORY"
    # notification.content_available = true
    # notification.custom_data = {foo: "bar"}

    # And... sent! That's all it takes.
    render json: params

  end
end
