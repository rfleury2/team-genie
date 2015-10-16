class MembershipsController < ApplicationController
	respond_to :json

	# Roster route
	def index
		team = find_team_by_id
		@memberships = team.memberships
		respond_with { @memberships }
	end

	def new
	end

	def create
		@team = find_team_by_id
		InviteToTeam.call(membership_params['email'], @team, current_user)
		assign_errors
		redirect_to team_path(@team)
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
		Team.find_by(id: params[:team_id])
	end

	def membership_params
		params.require(:membership).permit(:email)
	end
end