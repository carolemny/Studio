class RemoveDurationBooking < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :duration, :integer
  end
end
