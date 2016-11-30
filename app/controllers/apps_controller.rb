class AppsController < ApplicationController
  before_action :authenticate_user!
  def new
    current_user.update_attribute :token, User.new_token if current_user.token.nil?
    @app = App.new
  end

  def create
    App.create app_params
    redirect_to current_user
  end

  private
  def app_params
    params.required(:app).permit :user_id, :name, :url
  end
end
