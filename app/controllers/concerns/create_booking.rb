module CreateBooking
  private

  def create_booking
    @booking = Booking.create(start_date: session[:start_date], duration: session[:duration], guest_id: session[:guest_id], space_id: session[:space_id])
    @user_id = session[:guest_id]
    puts "@"*50
    puts @booking
    UserMailer.booking_email(@user_id, @booking).deliver_now
  end
end
