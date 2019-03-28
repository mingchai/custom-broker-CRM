class TwilioTextMessenger
  attr_reader :message

  def initialize(message, phone_number)
    @message = message
    @phone_number = phone_number
  end

  def text_client
    text = Twilio::REST::Client.new
    text.messages.create({
      from: Rails.application.credentials.twilio_phone_number,
      to: @phone_number,
      body: message
    })  
  end
end