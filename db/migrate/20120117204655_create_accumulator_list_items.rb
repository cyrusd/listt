class CreateAccumulatorListItems < ActiveRecord::Migration
  def change
    create_table :accumulator_list_items do |t|

      t.timestamps
    end
  end
end
