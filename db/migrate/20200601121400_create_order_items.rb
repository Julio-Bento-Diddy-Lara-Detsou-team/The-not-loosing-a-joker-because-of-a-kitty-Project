class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.float :total_price
      t.belongs_to :order, index: true
      t.belongs_to :item, index: true
      t.timestamps
    end
  end
end
