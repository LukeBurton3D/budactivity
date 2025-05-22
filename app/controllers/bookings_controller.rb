class BookingsController < ApplicationController
  before_action :set_activity

  def new
    @booking = @activity.bookings.new
  end

  def create
    @booking = @activity.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to new_activity_booking_path(@activity), notice: "Booking created!"
    else
      render :new
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def booking_params
    params.require(:booking).permit(:name, :email, :date)
  end
end
