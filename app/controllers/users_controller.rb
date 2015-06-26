class UsersController < ApplicationController
  before_action :find_user

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user)
  end

  def show
    @bookings_as_owner = []
    unless current_user.flats.blank?
      current_user.flats.each do |flat|
        @bookings_as_owner << flat.bookings
      end
    end
    @bookings_as_owner = @bookings_as_owner.flatten
    @bookings_as_user = current_user.bookings
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :picture, :description, :age, :email)
  end
end
