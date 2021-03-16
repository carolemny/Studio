class CreateJoinSpaceCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :join_space_categories do |t|
      t.belongs_to :category
      t.belongs_to :space
      t.timestamps
    end
  end
end
