class GamesController < ApplicationController
	respond_to :json

	def index
		team = find_team_by_id(params[:team_id])
		games = team.games
		render :json => games
	end

	def create
		team = find_team_by_id(params[:team_id])
		time = TimeConverter.call(params[:time])
		game = team.games.new(time: time)
		if game.save
			RsvpGenerator.create_from_game(game)
			render :json => game
		else
			redirect_to :back
		end
	end

	def update
	end

	def destroy
		game = find_game_by_id(params[:id])
		game.destroy
		render :json => game
	end

	private

	def find_team_by_id(id)
		Team.find_by(id: id)
	end

	def find_game_by_id(id)
		Game.find_by(id: id)
	end
end