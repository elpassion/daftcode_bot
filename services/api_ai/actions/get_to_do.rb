module ApiAi
  module Actions
    class GetToDo
      def call
        { text: message }
      end

      private

      attr_accessor :user

      def initialize(response)
        @user = User.find_by(psid: response[:psid])
      end

      def message
        user.to_do_list.present? ? user.to_do_list : "You don't have any todos"
      end
    end
  end
end
