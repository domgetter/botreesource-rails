class AddStatusFieldToTypes < ActiveRecord::Migration
  def change

    add_column :types, :status, :text

  end
end
