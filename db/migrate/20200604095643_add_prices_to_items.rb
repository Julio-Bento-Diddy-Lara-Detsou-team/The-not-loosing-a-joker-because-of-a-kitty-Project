class AddPricesToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :price, :float
    add_column :items, :price, :integer
  end
end
