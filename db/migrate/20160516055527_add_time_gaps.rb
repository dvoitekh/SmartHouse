class AddTimeGaps < ActiveRecord::Migration[5.0]
  def change
    create_table :time_gaps do |t|
      t.time :start
      t.time :end

      t.timestamps
    end

    create_table :devices_time_gaps do |t|
      t.integer :device_id
      t.integer :time_gap_id

      t.timestamps
    end

    add_index :devices_time_gaps, [:device_id, :time_gap_id]
  end
end
