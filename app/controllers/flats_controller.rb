class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new()
  end

  def edit
  end

  def update

  end

  def destroy
    @flat.destroy
  end

  private

  def find_flat
    @flat : Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :street, :zip_code, :city, :capacity, :price)
  end

end
