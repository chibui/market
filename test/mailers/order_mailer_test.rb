require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "new_order_notification" do
    mail = OrderMailer.new_order_notification
    assert_equal "New order notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
