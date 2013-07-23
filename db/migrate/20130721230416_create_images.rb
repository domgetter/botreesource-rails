class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :permalink
      t.string :owner
      t.integer :owner_id
      t.timestamps
    end
  end
end
