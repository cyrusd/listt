class CreateOrderedListItems < ActiveRecord::Migration
  def change
    create_table :ordered_list_items do |t|

      t.timestamps
    end
  end
end
