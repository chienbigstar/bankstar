class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action  :on_current_user
  def show
  end
  def update
    @user.update_attribute :money, user_param_money[:money].to_i
    redirect_to @user
  end

  private
  def user_param_money
    params.require(:user).permit :money
  end
  def on_current_user
    @user = current_user
  end
end
