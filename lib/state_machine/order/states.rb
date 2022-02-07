# frozen_string_literal: true

module StateMachine
  module Order
    module States
      extend ActiveSupport::Concern

      included do
        aasm column: :status do
          state :pending,
                initial: true
          state :in_progress
          state :completed
        end
      end
    end
  end
end
