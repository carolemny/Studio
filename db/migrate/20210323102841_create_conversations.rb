class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.references :contact1, index: true
      t.references :contact2, index: true

      t.timestamps
    end
  end
end
