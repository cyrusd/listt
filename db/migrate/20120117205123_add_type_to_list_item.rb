class AddTypeToListItem < ActiveRecord::Migration
  def change
    add_column :list_items, :type, :string
  end
end
