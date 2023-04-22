class UserDripperMailer < ActionMailer::Base
  def welcome_mail(mailing)
    mail(to: "hello@gmail.com", from: "hello@example.com", subject: "hello") do |f|
      f.text do
        "hello"
      end
    end
  end
end
