class UserNotificationMailer < ApplicationMailer
  def user_notification
    mail(to: "hello@gmail.com", from: "hello@example.com", subject: "hello") do |f|
      f.text do
        "hello this is from noticed gem"
      end
    end
  end
end
