class AddCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_column :devices, :category_id, :integer
  end
end
