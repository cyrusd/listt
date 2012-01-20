class AddListVisibilityToList < ActiveRecord::Migration
  def change
    add_column :lists, :visibility, :string
  end
end
