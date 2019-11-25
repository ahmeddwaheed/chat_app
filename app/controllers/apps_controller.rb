class AppsController < ApplicationController
  before_action :find_app, only: [:show, :update, :destroy]

  def index
    apps = App.all.limit(5)
    json_response(apps)
  end

  def show
    json_response(@app)
  end

  def create
    app_token = TokenGenerator.token
    app = App.create!(name: app_params[:name], token: app_token)
    json_response(app, :created)
  end

  def update
    @app.update!(app_params)
    json_response(@app)
  end

  def destroy
    @app.destroy
  end

  private

  def app_params
    params.require(:app).permit(:name)
  end

  def find_app
    @app = App.find_by(token: params[:id])
  end
end
