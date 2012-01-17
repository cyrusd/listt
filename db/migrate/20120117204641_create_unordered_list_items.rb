class CreateUnorderedListItems < ActiveRecord::Migration
  def change
    create_table :unordered_list_items do |t|

      t.timestamps
    end
  end
end
