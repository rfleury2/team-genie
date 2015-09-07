class TeamsController < ApplicationController
	def new
		@team = Team.new
	end

	def create
		@team = current_user.captainships.new(team_params)
		if @team.save
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
	end

	private 

	def team_params
		params.require(:team).permit(:name, :avatar)
	end

	def assign_errors
		@team.errors.full_messages.uniq
	end

	def find_team_by_id
		@team = Team.find_by(id: params[:id])
	end
end