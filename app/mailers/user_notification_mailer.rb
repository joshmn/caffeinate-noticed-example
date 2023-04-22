class UserNotificationMailer < ApplicationMailer
  def user_notification
    mail(to: "hello@gmail.com", from: "hello@example.com", subject: "hello") do |f|
      f.text do
        "hello"
      end
    end
  end
end
