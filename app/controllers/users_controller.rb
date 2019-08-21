class UsersController < ApplicationController
  def dashboard
    skip_authorization
  end

  def mykitchens
    @kitchens = current_user.kitchens
  end
end
