class UsersController < ApplicationController
  def dashboard
    skip_authorization
    @bookings = current_user.bookings
  end

  def mykitchens
    @kitchens = current_user.kitchens
  end

  # def myfavorites
  #  @favorites = current_user.favorites
  # end
end
