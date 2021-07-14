class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :menu_id
      t.string :status
      t.integer :quantity
      
    end
  end
end
