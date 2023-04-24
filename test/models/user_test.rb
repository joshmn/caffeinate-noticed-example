require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "a new user is sent a notification and signed up for a dripper" do
    user = User.create! phone: "123-123-1234"
    # This ^ shouldn't error

    assert user.notifications.count == 1
    assert user.caffeinate_campaign_subscriptions.count == 1
  end
end
