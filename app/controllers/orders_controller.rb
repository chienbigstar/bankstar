class OrdersController < ApplicationController
  def new
    user = User.find_by token: params[:authen_token]
    order = user.create_order order_params
    if order
      render html: :ok
    end
  end

  private
  def order_params
    params.permit :public_token, :private_token, :money
  end
end
