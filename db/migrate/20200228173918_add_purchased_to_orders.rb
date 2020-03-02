class AddPurchasedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :purchased, :boolean, default: false
  end
end
