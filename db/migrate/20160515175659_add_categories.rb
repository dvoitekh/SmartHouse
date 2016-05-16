class AddCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps
    end

    rename_column :devices, :category, :category_id
  end
end
