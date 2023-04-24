class UserMailer < ApplicationMailer
  # NOTE: Invoked by Caffeinate
  def two_day_welcome_followup_email(mailing)
    @user = mailing.subscriber

    mail(
      to: "#{@user.id}@example.com",
      from: "foo@bar.com",
      subject: "2 Days In: Getting started basics."
    )
  end

  # NOTE: Invoked by Caffeinate
  def thirty_day_welcome_followup_email(mailing)
    @user = mailing.subscriber

    mail(
      to: "#{@user.id}@example.com",
      from: "foo@bar.com",
      subject: "It's been a while..u ok?"
    )
  end

  # NOTE: Invoked by Noticed
  def welcome_notification
    @user = params[:user]

    mail(
      to: "#{@user.id}@example.com",
      from: "foo@bar.com",
      subject: "Welcome to our app!"
    )
  end
end
