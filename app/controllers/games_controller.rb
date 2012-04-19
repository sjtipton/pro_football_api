class GamesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    @games = Game.order("week ASC, played_at ASC, label ASC")
  end

  def show
    @game = Game.find(params[:id])
  end
end
