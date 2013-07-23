class AddDefaultValueToPosition < ActiveRecord::Migration
  def change

    change_table :types do |t|

      t.change :position, :integer, :null => false, :default => 0

    end

  end
end
