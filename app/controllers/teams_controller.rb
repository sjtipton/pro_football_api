class TeamsController < ApplicationController
	respond_to :json

	def index
		@teams = Team.all
	end

	def show
		@team = Team.find(params[:id])
	end
end