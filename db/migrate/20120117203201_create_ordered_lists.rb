class CreateOrderedLists < ActiveRecord::Migration
  def change
    create_table :ordered_lists do |t|

      t.timestamps
    end
  end
end
