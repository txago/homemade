class RemoveDeliveryAddressFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :delivery_address, :string
  end
end
