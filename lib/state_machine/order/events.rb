module StateMachine
  module Order
    module Events
      extend ActiveSupport::Concern

      included do
        aasm column: :status do
          event :start do
            transitions(
              from: :pending,
              to: :in_progress
            )
          end

          event :complete do
            transitions(
              from: :in_progress,
              to: :completed
            )
          end
        end
      end
    end
  end
end
