class TeamsController < ApplicationController
	def new
		@team = Team.new
	end

	def create
		@team = current_user.captainships.new(team_params)
		if @team.save
			redirect_to root_path
		else
			@errors = @team.errors.full_messages.uniq
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private 

	def team_params
		params.require(:team).permit(:name)
	end
end