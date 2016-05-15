class AddDevicesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.integer :user_id
      t.string :bt_mac_address
      t.string :category
      t.string :name
      t.float :power
      t.boolean :validity

      t.timestamps
    end
  end
end
