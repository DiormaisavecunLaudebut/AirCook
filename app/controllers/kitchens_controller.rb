class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @kitchens = policy_scope(Kitchen)
    @kitchens = Kitchen.geocoded
    @markers = @kitchens.map do |kitchen|
      {
        lat: kitchen.latitude,
        lng: kitchen.longitude
      }
    end

  end

  def new
    @kitchen = Kitchen.new
    authorize @kitchen
  end

  def create
    @kitchen = current_user.kitchens.new(kitchen_params)
    authorize @kitchen
    @kitchen.save ? (redirect_to kitchen_path(kitchen)) : (render 'new')
  end

  def show
    @booking = Booking.new
  end

  def edit
  end

  def update
    @kitchen.update
  end

  def destroy
    kitchen.user = current_user
    @kitchen.destroy
    redirect_to kitchens_path
  end

  def dashboard
    @bookings = current_user.bookings
  end


  private

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
    authorize @kitchen
  end

  def kitchen_params
    params.require(:kitchen).permit(
      :name,
      :location,
      :price,
      :description,
      :oven,
      :microwave,
      :thermomix,
      :ricecooker,
      :pastry_set,
      :other,
      :photo
    )
  end
end
