require 'pry'
require 'facebook/messenger'

include Facebook::Messenger

Bot.on :message do |input|
  binding.pry
  input.typing_on

  User.create(psid: input.sender['id'])

  api_ai_response = ApiAi::RequestSender.new(session_id: input.sender['id'], message: input.text).call
  parsed_response = ApiAi::ResponseParser.new(api_ai_response).call
  output          = ApiAi::OutputGenerator.new(parsed_response).call

  input.reply(output)
end