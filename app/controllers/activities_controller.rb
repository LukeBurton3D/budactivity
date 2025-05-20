class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render "activity/show", status: :unprocessable_entity
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :category, :description, :location, :photo)
  end
end
