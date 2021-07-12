class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :delivery_instructions
      t.string :phone
      t.string :address
      
    end
  end
end
