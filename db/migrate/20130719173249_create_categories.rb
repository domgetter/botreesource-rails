class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :type_id
      t.string :name, :limit => 100
      t.string :image
      t.integer :position

      t.timestamps
    end
  end
end
