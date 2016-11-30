class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.string :public_token
      t.string :private_token
      t.string :money
      t.timestamps
    end
  end
end
