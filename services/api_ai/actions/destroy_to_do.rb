module ApiAi
  module Actions
    class DestroyToDo
      def call
        return { text: output } if action_incomplete

        ids = user.to_dos.ids.values_at(*items.map { |item| item - 1 }).compact
        user.to_dos.where(id: ids).delete_all

        { text: 'Your tasks where successfully deleted' }
      end

      private

      attr_accessor :user, :output, :action_incomplete, :items

      def initialize(response)
        @user = User.find_by(psid: response[:psid])
        @output = response[:output]
        @action_incomplete = response[:action_incomplete]
        @items = response[:parameters][:items]
      end
    end
  end
end
