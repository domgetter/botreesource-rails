class AddDefaultColumnToImages < ActiveRecord::Migration
  def change

    add_column :images, :default, :boolean, :null => false, :default => false

  end
end
