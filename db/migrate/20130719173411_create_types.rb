class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name, :limit => 100
      t.string :image
      t.integer :position, :null => false

      t.timestamps
    end
  end
end
