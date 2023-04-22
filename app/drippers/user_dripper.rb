class UserDripper < ApplicationDripper
  self.campaign = :user_dripper

  drip :welcome_mail, mailer_class: 'UserDripperMailer', delay: 0.minutes
  drip :welcome_notification, action_class: 'UserNotificationAction', delay: 0.minutes
end
