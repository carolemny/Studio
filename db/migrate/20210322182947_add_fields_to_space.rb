class AddFieldsToSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :spaces, :latitude, :decimal
    add_column :spaces, :longitude, :decimal
  end
end
