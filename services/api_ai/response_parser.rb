module ApiAi
  class ResponseParser
    def call
      { action: response[:result][:action].to_sym,
        action_incomplete: response[:result][:actionIncomplete],
        output: output,
        parameters: response[:result][:parameters],
        psid: response[:sessionId] }
    end

    private

    attr_reader :response

    def initialize(response)
      @response = response
    end

    def output
      messages = response[:result][:fulfillment][:messages]
      messages.detect { |message| message[:type] == 0 }[:speech]
    end
  end
end
