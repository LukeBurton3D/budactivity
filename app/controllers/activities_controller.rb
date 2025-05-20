class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def show
    # raise
    @activity = Activity.find(params[:id])
    # we want to make a new booking on the show page
    @booking = @activity.user.booking.new
    @booking.user = current_user
    redirect_to activities_path
  end
end
