class RsvpsController < ApplicationController
	respond_to :json

	def index
		game = find_game(params[:game_id])
		@rsvps = game.rsvps
		respond_with { @rsvps }
	end

	def show
	end

	def update
	end

	private

	def find_membership(team_id)
	end

	def find_game(game_id)
		Game.find_by(id: game_id)
	end
end