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
			create_captain_membership
			@teams = current_user.captainships
			redirect_to team_path(@team)
		else
			assign_errors
			render :new
		end
	end

	def show
		find_team_by_id
	end

	def edit
		find_team_by_id
		render partial: 'edit', locals: { team: @team }
	end

	def update
		find_team_by_id
		if @team
			@team.update_attributes(team_params)
			redirect_to team_path(@team)
		else
			redirect_to root_path
		end
	end

	def destroy
		find_team_by_id
		@team.destroy
		redirect_to root_path
	end

	LIST_OF_SPORTS = ['Soccer', 'Flag Football', 'Basketball', 'Softball', 'Kickball', 'Other']

	private 

	def team_params
		params.require(:team).permit(:name, :avatar, :sport)
	end

	def create_captain_membership
		@team.memberships.create(player: current_user, role: "captain")
	end

	def assign_errors
		@errors = @team.errors.full_messages.uniq
	end

	def find_team_by_id
		@team = Team.find_by(id: params[:id])
	end
end