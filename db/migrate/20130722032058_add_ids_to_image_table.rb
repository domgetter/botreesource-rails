class AddIdsToImageTable < ActiveRecord::Migration
  def change
   
    add_column :images, :product_id, :integer
    add_column :images, :category_id, :integer
    add_column :images, :type_id, :integer

    remove_column :images, :owner, :string
    remove_column :images, :owner_id, :integer

  end
end
