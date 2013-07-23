class AlterTypes < ActiveRecord::Migration
  def change
    change_table :types do |t|

      t.change :position, :integer
    end
  end
end
