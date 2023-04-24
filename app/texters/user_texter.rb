class UserTexter < ApplicationTexter
  # NOTE: Invoked by Noticed
  def welcome_notification
    @user = params[:user]

    message(
      to: @user.phone,
      from: "18001231234",
      body: "Welcome to our new platform!"
    )
  end
  # NOTE: Preview in console via:
  #> UserTexter.two_day_welcome_followup_text(user: User.last).deliver

  # NOTE: Invoked by Caffeinate
  def two_day_welcome_followup_text(texting)
    @user = texting.subscriber

    message(
      to: @user.phone,
      from: "18001231234",
      body: "How's setup going?"
    )
  end
  # NOTE: Preview in console via:
  #> UserTexter.two_day_welcome_followup_text(MockMailing.new(User.last)).deliver

  # NOTE: Invoked by Caffeinate
  def thirty_day_welcome_followup_text(texting)
    @user = texting.subscriber

    message(
      to: @user.phone,
      from: "18001231234",
      body: "One month in... how are you doing with XYZ service?"
    )
  end
  # NOTE: Preview in console via:
  #> UserTexter.thirty_day_welcome_followup_text(MockMailing.new(User.last)).deliver
end
