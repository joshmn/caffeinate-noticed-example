# NOTE: Custom delivery method LARGELY modeled after the Email delivery method,
# since the Texter construct is largely modeled after ActionMailer!
# See: https://github.com/excid3/noticed/blob/master/lib/noticed/delivery_methods/email.rb
# NOTE: Doesn't support :enqueue option / 'deliver later' functionality. May add later.
class DeliveryMethods::Sms < Noticed::DeliveryMethods::Base
  def deliver
    texter.send(method.to_sym, format).deliver
  end

  private

  # texter: "UserTexter"
  # texter: UserTexter
  def texter
    option = options.fetch(:texter)
    case option
    when String
      option.constantize
    else
      option
    end
  end

  # Method should be a symbol
  #
  # If notification responds to symbol, call that method and use return value
  # If notification does not respond to symbol, use the symbol for the texter method
  # Otherwise, use the underscored notification class name as the texter method
  def method
    method_name = options[:method]&.to_sym
    if method_name.present?
      notification.respond_to?(method_name) ? notification.send(method_name) : method_name
    else
      notification.class.name.underscore
    end
  end

  def format
    params = if (method = options[:format])
      notification.send(method)
    else
      notification.params
    end
    params.merge(recipient: recipient, record: record)
  end
end
