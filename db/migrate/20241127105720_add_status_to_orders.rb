class AddStatusToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :status, :integer
  end
end
