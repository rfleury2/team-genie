class TeamsController < ApplicationController
	def new
		@team = Team.new
		@list_of_sports = LIST_OF_SPORTS
	end

	def index
		@teams = current_user.captainships
	end

	def create
		@team = current_user.captainships.new(team_params)
		if @team.save
			Membership.create_captain_membership(@team, current_user)
			@teams = current_user.captainships
			redirect_to team_path(@team)
		else
			assign_errors
			render :new
		end
	end

	def show
		@team = find_team_by_id
	end

	def edit
		@team = find_team_by_id
		render partial: 'edit', locals: { team: @team }
	end

	def update
		@team = find_team_by_id
		if @team
			@team.update_attributes(team_params)
			redirect_to team_path(@team)
		else
			redirect_to root_path
		end
	end

	def destroy
		@team = find_team_by_id
		@team.destroy
		redirect_to root_path
	end

	def roster
		@team = find_team_by_team_id
		render partial: 'teams/roster', locals: { team: @team }
	end

	LIST_OF_SPORTS = ['Soccer', 'Flag Football', 'Basketball', 'Softball', 'Kickball', 'Other']

	private 

	def team_params
		params.require(:team).permit(:name, :avatar, :sport)
	end

	def assign_errors
		@errors = @team.errors.full_messages.uniq
	end

	def find_team_by_id
		Team.find_by(id: params[:id])
	end

	def find_team_by_team_id
		Team.find_by(id: params[:team_id])
	end
end