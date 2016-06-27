class TextHandler
  def self.send_notification(order)
    twilio_number = ENV['TWILIO_NUMBER']
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    alert = "NOTICE: Your order is now #{order.status}"

    client.account.messages.create(
      from: twilio_number,
      to: "ADD NUMBER HERE",
      body: alert,
    )
  end
end
