class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @user = current_user
    @activity = Activity.new(activity_params)
    @activity.user = @user
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :category, :location, :user_id)
  end
end
