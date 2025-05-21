class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {activity: activity}),
        marker_html: render_to_string(partial: "marker", locals: {activity: activity}) # Pass the activity to the partial
    }
    end
  end

  def show
    # raise
    @activity = Activity.find(params[:id])
    # we want to make a new booking on the show page
    # @booking = Booking.new
    # @booking.user = current_user
  end

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
