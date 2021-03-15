class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :guest, index: true
      t.belongs_to :space
      t.timestamps
    end
  end
end
