class RsvpsController < ApplicationController
	respond_to :json

	def index
		game = find_game(params[:game_id])
		@rsvps = game.rsvps
		respond_with { @rsvps }
	end

	def update
		rsvp = find_rsvp(params[:id])
		puts rsvp.membership.player.name
		rsvp_success = rsvp.update_attributes(rsvp_params)
		puts rsvp_success
		render :json => { success: rsvp_success }
	end

	def accept
	end

	def decline 
	end

	private

	def rsvp_params
		params.require(:rsvp).permit(:response, :comment)
	end

	def find_membership(team_id)
	end

	def find_game(game_id)
		Game.find_by(id: game_id)
	end

	def find_rsvp(rsvp_id)
		Rsvp.find_by(id: rsvp_id)
	end

end