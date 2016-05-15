class AddActiveToDevice < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :active, :boolean, default: false, null: false
  end
end
