class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @flats = Flat.all#.where(city: params[:city])
  end

  def show
    @booking = Booking.new
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
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :street, :zip_code, :city, :capacity, :price, :picture)
  end

end
