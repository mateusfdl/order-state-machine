module StateMachine
  module Order
    module OrderStateMachine
      extend ActiveSupport::Concern

      included do
        include AASM
        include States
        include Events
      end
    end
  end
end
