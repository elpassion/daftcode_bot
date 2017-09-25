module ApiAi
  module Actions
    class CreateToDo
      def call
        return { text: output } if action_incomplete

        user.to_dos.create(item: item)

        { text: user.to_do_list }
      end

      private

      attr_accessor :user, :output, :action_incomplete, :item

      def initialize(response)
        @user = User.find_by(psid: response[:psid])
        @output = response[:output]
        @action_incomplete = response[:action_incomplete]
        @item = response[:parameters][:item]
      end
    end
  end
end
