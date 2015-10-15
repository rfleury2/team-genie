class GamesController < ApplicationController
	def create
		team = find_team_by_id(params[:team_id])
		time = TimeConverter.call(params[:game])
		game = team.games.new(time: time)
		if game.save
			redirect_to :back
		else
			redirect_to :back, game_create: 'fail'
		end
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def find_team_by_id(id)
		Team.find_by(id: id)
	end
end