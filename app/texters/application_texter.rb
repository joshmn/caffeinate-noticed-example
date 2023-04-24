class ApplicationTexter < Caffeinate::Action
  class Envelope
    attr_reader :sent

    def initialize(from, to, body)
      @from, @to, @body = from, to, body
    end

    def deliver(texter)
      # do other stuff to prep / save @sms here
      # do the send (spoofed in this project)
      puts "SENDING SMS"
      puts "To: #{@to}"
      puts "From: #{@from}"
      puts "Body: #{@body}"

      @sent = true
    end
    alias_method :deliver!, :deliver
  end

  def message(to:, from:, body:)
    Envelope.new(to, from, body)
  end
end
