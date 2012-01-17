class CreateAccumulatorLists < ActiveRecord::Migration
  def change
    create_table :accumulator_lists do |t|

      t.timestamps
    end
  end
end
