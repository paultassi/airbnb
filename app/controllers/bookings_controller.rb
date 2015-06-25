class BookingsController < ApplicationController
  before_action :find_booking, only: [:update]
  before_action :find_flat, only: [:create, :price_definition]

  def index
    @bookings_as_owner = []
    unless current_user.flats.blank?
      current_user.flats.each do |flat|
        @bookings_as_owner << flat.bookings
      end
    end
    @bookings_as_owner = @bookings_as_owner.flatten
    @bookings_as_user = current_user.bookings
  end

  # def new
  #   @booking = Booking.new
  # end

  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.flat = @flat

    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render "flats/show"
    end
  end

  def update
    validated = params[:validated] == 'true' #string true -> boolean
    @booking.update({validated: validated})

    redirect_to bookings_path(@booking)
  end


  # def destroy
  #   @booking.destroy
  # end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_flat
    @flat = Flat.find(params[:flat_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
