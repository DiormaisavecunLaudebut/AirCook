class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:like, :dislike]


  def index
    @kitchens = policy_scope(Kitchen)

    if params[:query].present?
      @kitchens = Kitchen.near(params[:query], 2)
    else
      @kitchens = Kitchen.all
    end

    @markers = @kitchens.map do |kitchen|
      {
        lat: kitchen.latitude,
        lng: kitchen.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { kitchen: kitchen }),
        image_url: helpers.asset_url('https://res.cloudinary.com/dlodtvkez/image/upload/v1566563060/kitchen-marker.png')
        # infoWindow: render_to_string(partial: "info_window", locals: { kitchen: kitchen })
      }
    end
  end

  def like
    like = Like.new(
      user: current_user,
      kitchen: Kitchen.find(params[:kitchen_id].to_i),
      like: true
    )
    like.save
    redirect_to kitchens_path
  end

  def dislike
    like = current_user.likes.select { |i| i.kitchen_id == params[:kitchen_id].to_i }
    like.first.destroy
    redirect_to kitchens_path
  end

  def new
    @kitchen = Kitchen.new
    authorize @kitchen
  end

  def create
    @kitchen = current_user.kitchens.new(kitchen_params)
    authorize @kitchen
    @kitchen.save ? (redirect_to mykitchens_path) : (render 'new')
  end

  def show
    @booking = Booking.new
    @reviews = @kitchen.reviews
    @months = %w(nada Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
    @kitchen = Kitchen.geocoded[Kitchen.geocoded.index(@kitchen)]
    @marker = {
      lat: @kitchen.latitude,
      lng: @kitchen.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { kitchen: @kitchen }),
      image_url: helpers.asset_url('https://res.cloudinary.com/dlodtvkez/image/upload/v1566563060/kitchen-marker.png')
    }
  end

  def edit
  end

  def update
    @kitchen.update
  end

  def destroy
    @kitchen.destroy
    redirect_to mykitchens_path
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
      :address,
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
