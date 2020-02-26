class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :delivery_address
      t.float :shipping_cost
      t.references :user
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
