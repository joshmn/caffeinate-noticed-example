# http://127.0.0.1:3000/rails/mailers
class UserMailerPreview < ActionMailer::Preview
  def two_day_welcome_followup_email
    UserMailer.two_day_welcome_followup_email(MockMailing.new(User.last))
  end

  def thirty_day_welcome_followup_email
    UserMailer.thirty_day_welcome_followup_email(MockMailing.new(User.last))
  end

  def welcome_notification
    UserMailer.with(user: User.last).welcome_notification
  end
end
