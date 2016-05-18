class AddAggregatesAndDatesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :aggregates do |t|
      t.integer :device_id
      t.date :date
      t.float :energy

      t.timestamps
    end
  end
end
