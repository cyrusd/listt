class RenameListNameToListTitle < ActiveRecord::Migration
  def up
    rename_column :lists, :name, :title
  end

  def down
    rename_column :lists, :title, :name
  end
end
