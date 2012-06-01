class GamesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    order_by = "week ASC, played_at ASC, label ASC"
    if params[:week].present?
      @games = Game.where(week: params[:week]).order(order_by)
    else
      @games = Game.order(order_by)
    end
  end

  def show
    @game = Game.find(params[:id])
  end
end
