class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :identifier
      t.string :name
      t.string :description
      t.string :length
      t.string :width
      t.string :height
      t.integer :position
      t.string :status


      t.timestamps
    end
  end
end
