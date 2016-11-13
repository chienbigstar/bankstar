class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = Order.find_by public_token: params[:token]
    @payment = Payment.new
    render html: "not found" unless @order
  end

  def create
    @order = Order.find_by_id payment_params[:order_id]
    new_money = current_user.money.to_i - @order.money.to_i
    current_user.update_attribute :money, new_money
    render html: :ok
  end

  private
  def payment_params
    params.require(:payment).permit :order_id
  end
end
