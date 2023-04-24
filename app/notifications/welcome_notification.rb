# WelcomeNotification.with(user: @user).deliver(@user)

class WelcomeNotification < Noticed::Base
  # Add your delivery methods
  #
  # deliver_by :database
  deliver_by :email, mailer: "UserMailer"
  deliver_by :text, class: "DeliveryMethods::Sms", texter: "UserTexter"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :user

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  #   post_path(params[:post])
  # end
end
