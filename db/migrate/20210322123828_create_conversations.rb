class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.references :recipient, index: true
      t.references :sender, index: true

      t.timestamps
    end
  end
end
