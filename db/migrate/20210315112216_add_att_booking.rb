class AddAttBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :start_date, :datetime
    add_column :bookings, :duration, :integer
  end
end
