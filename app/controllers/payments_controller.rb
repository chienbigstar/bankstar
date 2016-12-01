require "net/http"
require "net/https"

class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = Order.find_by public_token: params[:token]
    render html: "not found" unless @order
  end

  def create
    @order = Order.find_by_id payment_params[:order_id]
    if @order
      if @order.done?
        render html: "already payment"
        return
      end
      new_money = current_user.money.to_i < order.money.to_i
      if new_money < 0
        render html: "not enough money"
        return
      end
      current_user.update_attribute :money, new_money
      reply_link
      render html: :ok
    else
      render html: :wrong
    end
  end

  private
  def payment_params
    params.require(:payment).permit :order_id
  end

  def reply_link
    uri = URI @order.user.app.reply_url
    params = {token: @order.private_token}
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
  end
end
