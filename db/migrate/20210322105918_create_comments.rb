class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.references :space
      t.references :guest, index: true

      t.timestamps
    end
  end
end
