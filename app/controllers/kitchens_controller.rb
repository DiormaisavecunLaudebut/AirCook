class KitchensController < ApplicationController
  def new
    @kitchen = Kitchen.new
  end

  def create
    kitchen = Kitchen.new(kitchen_params)
    kitchen.user = current_user
    kitchen.save ? (redirect_to kitchen_path(kitchen)) : (render 'new')
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
      :other
    )
  end
end