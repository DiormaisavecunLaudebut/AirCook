class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.kitchen = Kitchen.find(params[:kitchen_id])
    @booking.user = current_user
    authorize @booking
    if @booking.save
      flash[:alert] = "Kitchen booked, bon appétit!"
      (redirect_to kitchens_path)
    else
      (render 'new')
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
