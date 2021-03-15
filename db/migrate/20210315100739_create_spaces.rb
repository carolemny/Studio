class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.references :host, index: true
      t.text :description
      t.string :zip_code
      t.string :address
      t.string :city
      t.timestamps
    end
  end
end
