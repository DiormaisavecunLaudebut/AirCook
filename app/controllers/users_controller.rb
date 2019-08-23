class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:accept, :decline]
  def dashboard
    skip_authorization
    @bookings = current_user.bookings
  end

  def mykitchens
    @kitchens = current_user.kitchens
    @bookings = current_user.kitchens.map(&:bookings)
  end

  def myfavorites
    skip_authorization
    @kitchens = current_user.likes.map(&:kitchen)
  end

  def accept
    booking = Booking.find(params[:booking_id])
    booking.status = "Accepted"
    booking.save
    redirect_to dashboard_path
  end

  def decline
    booking = Booking.find(params[:booking_id])
    booking.status = "Declined"
    booking.save
    redirect_to dashboard_path
  end
end
