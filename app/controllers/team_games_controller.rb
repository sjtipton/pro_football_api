class TeamGamesController < ApplicationController
	before_filter :authenticate_user!
	respond_to :json

	def index
		id = params[:id]
		@games = Game.where("away_team_id = ? or home_team_id = ?", id, id).order("week ASC")
	end
end