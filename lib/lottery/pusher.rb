module Lottery
  class Pusher
    attr_accessor :body, :client

    def initialize(body)
      self.body   = body
      self.client = Twilio::REST::Client.new(CONFIG['client']['account_sid'], CONFIG['client']['auth_token'])
    end

    def send
      CONFIG['sms']['to'].each do |to|
        client.messages.create(
            from: CONFIG['sms']['from'],
            to: to,
            body: body
          )
      end
    end

    private :body=, :client=
  end
end