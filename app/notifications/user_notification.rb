# To deliver this notification:
#
# UserNotification.with(post: @post).deliver_later(current_user)
# UserNotification.with(post: @post).deliver(current_user)

class UserNotification < Noticed::Base
  # Add your delivery methods
  #
  # deliver_by :database
  deliver_by :email, mailer: "UserNotificationMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

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
