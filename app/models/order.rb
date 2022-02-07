# frozen_string_literal: true

class Order < ApplicationRecord
  include StateMachine::Order::OrderStateMachine

  scope :by_status, ->(status) { where(status: status) }
  scope :by_control_number, ->(control_number) { where(control_number: control_number) }
end
