class UserNotificationAction < Caffeinate::Action
  class Envelope
    def initialize(user)
      @notification = UserNotification.new(with: user)
    end

    def deliver!(action)
      @notification.deliver(action.action_name)
    end
  end

  def welcome_notification(mailing)
    Envelope.new(mailing.subscriber)
  end
end
