# frozen_string_literal: true

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
