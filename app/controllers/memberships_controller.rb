class MembershipsController < ApplicationController
	respond_to :json

	# Roster route
	def index
		team = find_team_by_id
		# TODO: address performance issue
		@memberships = team.memberships
		respond_with { @memberships }
	end

	def new
	end

	def create
		@team = find_team_by_id
		InviteToTeam.call(membership_params['email'], @team, current_user)
		render :nothing => true, :status => 200
	end

	def destroy
		membership = find_membership_by_id
		membership.destroy
		render :nothing => true, :status => 200
	end

	private 

	def find_team_by_id
		Team.find_by(id: params[:team_id])
	end

	def find_membership_by_id
		Membership.find_by(id: params[:id])
	end

	def membership_params
		params.permit(:email)
	end
end