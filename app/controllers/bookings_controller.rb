class BookingsController < ApplicationController
  before_action :set_activity, only: [:new, :create]
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings.includes(:activity)
  end

  def new
    @booking = @activity.bookings.new
  end

  def create
    @booking = @activity.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path, notice: "Booking created!"
    else
      render :new
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :accepted)
  end
end
