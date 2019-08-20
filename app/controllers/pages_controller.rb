class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :lior]

  def home
  end

  def lior
  end
end
