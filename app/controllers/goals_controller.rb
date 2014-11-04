class GoalsController < ApplicationController
	def index
	end

	def create
		@goal = Goal.new(goal_params)
		@goal.user_id = params[:user_id]
		if @goal.save
			redirect_to user_goals_url(current_user)
		else
			flash.now[:errors] = @goal.errors.full_messages
			redirect_to user_goals_url(current_user)
		end
	end

	def destroy
		@goal = Goal.find(params[:id])
		Goal.delete(@goal)
		redirect_to user_goals_url(current_user.id)
	end

	def show
		@goal = Goal.find(params[:id])
		render :show
	end

	def edit
		@goal = Goal.find(params[:id])

		render :edit
	end

	def update
		@goal = Goal.find(params[:id])
		@goal.update_attributes(goal_params)
		#should come back and make sure it saved; should add validations to model
		redirect_to user_goals_url(@goal.user)
	end

	private
	def goal_params
		params.require(:goal).permit(:body, :title, :deadline)
	end
end
