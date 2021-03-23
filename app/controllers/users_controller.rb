class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = User.find(params[:id])

    @bookings = Booking.where(guest_id: current_user.id)
    puts "x" * 100 
    @bookings.each { |booking| puts booking.space.title }
    puts "x" * 100
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "Votre profil a été mis à jour. "
      redirect_to user_path
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :description, :first_name, :last_name, :phone_number,:avatar)
  end
end
