class CreateShoppingSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_sessions do |t|
      t.belongs_to :cart
      t.belongs_to :item

      t.timestamps
    end
  end
end
