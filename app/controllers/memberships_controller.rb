class MembershipsController < ApplicationController
	def new
	end

	def create
		find_team_by_id
		if invited_player_is_user?(membership_params['email']) && !@team.is_member?(@player)
			@player.memberships.create(team: @team)
		else
			# errors won't show until I js this
			assign_errors
		end
		redirect_to team_path(@team, result: @something)
	end

	private 

	def assign_errors
		@errors = []
		@errors << already_belongs_error if @team.is_member?(@player)
		@errors << "Not a user - to be implemented later" if !invited_player_is_user?(membership_params['email'])
	end

	def invited_player_is_user?(email)
		@player = User.find_by_email(email)
	end

	def already_belongs_error
		"Player is already a team member."
	end

	def find_team_by_id
		@team = Team.find_by(id: params[:team_id])
	end

	def membership_params
		params.require(:membership).permit(:email)
	end
end