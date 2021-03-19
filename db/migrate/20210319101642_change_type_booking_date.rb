class ChangeTypeBookingDate < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :bookings, :start_date, :date
      change_column :bookings, :start_date, :date
    end

    def down
      change_column :bookings, :start_date, :datetime
      change_column :bookings, :start_date, :datetime
    end
  end
end
