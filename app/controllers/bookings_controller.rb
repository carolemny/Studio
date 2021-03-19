class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :is_guest?, only: [:show, :edit, :destroy, :update]
  before_action :start_date_is_possible?, only: [:update, :edit]

  def show
  end

  def new
    @booking = Booking.new
    @space = set_space
  end

  def edit
  end

  def create
    #to delete ?
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: "La réservation a bien été mise à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to spaces_path, notice: "La réservation a bien été annulée. "
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_space
    @space = Space.find(params[:space_id])
  end

  def booking_params
    params.permit(:start_date, :space_id, :guest_id, :duration)
  end

  def is_guest?
    @booking = set_booking
    unless @booking.guest_id == current_user.id
      flash[:error] = "Vous n'êtes pas autorisé à modifier cette réservation."
      redirect_to root_path
    end
  end
end
