class BookingsController < ApplicationController
  after_action :verify_authorized, except: [:destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @kitchen = Kitchen.find(params[:kitchen_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.kitchen = Kitchen.find(params[:kitchen_id])
    @booking.user = current_user
    authorize @booking
    if @booking.save
      flash[:alert] = "Kitchen booked, bon appétit!"
      (redirect_to dashboard_path)
    else
      (render 'new')
    end
  end

  def destroy
    # @user_bookings = current_user.bookings
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
