class CreateUnorderedLists < ActiveRecord::Migration
  def change
    create_table :unordered_lists do |t|

      t.timestamps
    end
  end
end
