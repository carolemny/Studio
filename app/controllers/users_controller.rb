class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = current_user
    puts '**********************************************************************************'
  end

  def edit
    @user = current_user
  end

  def update
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
