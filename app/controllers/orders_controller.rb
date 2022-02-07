# frozen_string_literal: true

class OrdersController < ApplicationController
  attr_reader :order

  before_action :find_order, only: %i[start_progress complete]

  def index
    @orders = Order.all
    apply_filters
  end

  def new
    @order = Order.new(control_number: Random.rand(1..999_999)).save!
    redirect_to orders_path
  end

  def start_progress
    order.start! if order.may_start?
    redirect_to orders_path
  end

  def complete
    order.complete! if order.may_complete?
    redirect_to orders_path
  end

  def apply_filters
    orders_by_control_number
    orders_by_status
  end

  private

  def find_order
    @order = Order.find(params[:order_id])
  end

  def orders_by_control_number
    return if control_number_params.blank?

    @orders = @orders.by_control_number(control_number_params)
  end

  def orders_by_status
    return if status_params.blank?

    @orders = @orders.by_status(status_params)
  end

  def status_params
    params[:status]
  end

  def control_number_params
    params[:control_number]
  end
end
