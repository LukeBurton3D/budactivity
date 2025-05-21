class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {activity: activity})
      }
    end
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
