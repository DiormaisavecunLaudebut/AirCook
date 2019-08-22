class UsersController < ApplicationController
  def dashboard
    skip_authorization
    @kitchens = current_user.bookings.map { |booking| booking.kitchen }
    
  end

  def mykitchens
    @kitchens = current_user.kitchens
  end

  # def myfavorites
  #  @favorites = current_user.favorites
  # end
end
