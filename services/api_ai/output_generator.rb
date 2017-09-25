module ApiAi
  class OutputGenerator
    ACTION_PERFORMERS = {
      create_to_do: Actions::CreateToDo,
      destroy_to_do: Actions::DestroyToDo,
      get_to_do: Actions::GetToDo
    }.freeze

    def call
      return { text: response[:output] } unless action_performer

      action_performer.new(response).call
    end

    private

    attr_reader :response, :action_performer

    def initialize(response)
      @response = response
      @action_performer = ACTION_PERFORMERS[response[:action]]
    end
  end
end
