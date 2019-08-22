class UsersController < ApplicationController

  def dashboard
    skip_authorization
    @bookings = current_user.bookings
  end

  def mykitchens
    @kitchens = current_user.kitchens
  end

  def myfavorites
    skip_authorization
    @kitchens = current_user.likes.map(&:kitchen)
  end
end
