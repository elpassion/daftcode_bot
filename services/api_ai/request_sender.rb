module ApiAi
  class RequestSender
    def call
      response = HTTP.auth(ENV['API_AI_AUTH']).get(url, params: params)
      JSON.parse(response, symbolize_names: true) if response.code == 200
    end

    private

    attr_reader :session_id, :message

    def initialize(session_id:, message:)
      @session_id = session_id
      @message = message
    end

    def url
      URI.join(ENV['API_AI_URL'], 'query').to_s
    end

    def params
      { query: message,
        v: '20170807',
        sessionId: session_id,
        lang: 'en' }.compact
    end
  end
end
