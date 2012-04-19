class TeamsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end
end
