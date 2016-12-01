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

  def edit
    @app = App.find params[:id]
  end

  def update
    @app = App.find params[:id]
    @app.update app_params
    redirect_to current_user
  end

  private
  def app_params
    params.required(:app).permit :user_id, :name, :url, :reply_url, :token
  end
end
