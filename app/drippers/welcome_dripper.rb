class WelcomeDripper < ApplicationDripper
  self.campaign = :welcome_dripper

  before_drip do |_drip, mailing|
    # some logic for opting out if the user is already past initial 'welcome' / setup steps
  end

  drip :two_day_welcome_followup_email, mailer: "UserMailer", delay: 2.days
  drip :two_day_welcome_followup_text, mailer: "UserTexter", delay: 2.days

  drip :thirty_day_welcome_followup_email, mailer: "UserMailer", delay: 30.days
  drip :thirty_day_welcome_followup_text, mailer: "UserTexter", delay: 30.days
end
