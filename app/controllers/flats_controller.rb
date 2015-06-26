class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @flats = Flat.all
  end

  def show
    @booking = Booking.new
    @flat = Flat.find(params[:id])
    # @flat_coordinates = [{ lat: @flat.latitude, lng: @flat.longitude }]

    @markers = Gmaps4rails.build_markers(@flat) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = current_user.flats.build(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    redirect_to :back if current_user != @flat.user
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
  end

  def search
    @flats = Flat.all.where(city: params[:city])
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :street, :zip_code, :city, :capacity, :price, :picture, :house_type, :description, :room_number, :bed_number)
  end

end
