require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#by_status' do
    it 'returns orders filtered by status' do
      Order.new(status: 'pending').save!
      Order.new(status: 'pending').save!
      Order.new(status: 'completed').save!

      expect(Order.by_status('pending').count).to eq(2)
      expect(Order.by_status('completed').count).to eq(1)
    end
  end

  describe '#by_control_number' do
    it 'returns orders filtered by control number' do
      Order.new(control_number: '123').save!
      Order.new(control_number: '456').save!
      Order.new(control_number: '789').save!

      expect(Order.by_control_number('123').count).to eq(1)
      expect(Order.by_control_number('456').count).to eq(1)
      expect(Order.by_control_number('789').count).to eq(1)
    end
  end

  describe 'state machine' do
    context 'when generated' do
      it 'returns pending state' do
        order = Order.new
        order.save!

        expect(order.aasm.current_state).to eq(Order::STATE_PENDING)
      end

      it 'allow to transact to in progress state' do
        order = Order.new
        order.start!

        expect(order.aasm.current_state).to eq(Order::STATE_IN_PROGRESS)
      end

      it 'dont allow transact to completed state' do
        order = Order.new

        expect { order.complete! }.to raise_error
      end
    end

    context 'when in progress' do
      it 'returns in progress state' do
        order = Order.new
        order.start!

        expect(order.aasm.current_state).to eq(Order::STATE_IN_PROGRESS)
      end

      it 'allow to transact to completed state' do
        order = Order.new
        order.start!
        order.complete!

        expect(order.aasm.current_state).to eq(Order::STATE_COMPLETED)
      end

      it 'dont allow back to in progress state' do
        expect { order.start! }.to raise_error
      end
    end

    context 'when completed' do
      it 'return completed state' do
        order = Order.new

        order.start!
        order.complete!

        expect(order.aasm.current_state).to eq(Order::STATE_COMPLETED)
      end

      it 'dont allow to transact to any other state' do
        order = Order.new
        order.start!
        order.complete!

        expect { order.start! }.to raise_error
      end
    end
  end
end
