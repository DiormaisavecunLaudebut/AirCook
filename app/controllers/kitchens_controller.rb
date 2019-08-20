class KitchensController < ApplicationController
  def index
    @kitchens = Kitchen.all
  end

  def new
    @kitchen = Kitchen.new
  end

  def create
    kitchen = Kitchen.new(kitchen_params)
    kitchen.user = current_user
    kitchen.save ? (redirect_to kitchen_path(kitchen)) : (render 'new')
  end

  def show
    @kitchen = Kitchen.find(params[:id])
  end

  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  def update
    @kitchen = Kitchen.find(params[:id])
    @kitchen.update
  end

  def destroy
    @kitchen = Kitchen.find(params[:id])
    kitchen.user = current_user
    @kitchen.destroy
    redirect_to kitchens_path
  end

  def dashboard
    @bookings = current_user.bookings
  end


  private

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
