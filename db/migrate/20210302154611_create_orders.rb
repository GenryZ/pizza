class CreateOrders < ActiveRecord::Migration[6.1]
  def change
  	create_table :orders do |o|
  		o.text :order_input
  		o.text :name
  		o.text :phone
  		o.text :address
  		o.timestamps
  	end
  end
end
