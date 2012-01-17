class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :user_id
      t.integer :list_id
      t.integer :position
      t.integer :count
      t.text :body

      t.timestamps
    end
  end
end
