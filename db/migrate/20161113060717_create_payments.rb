class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :order
      t.references :user
      t.integer :status
      t.timestamps
    end
  end
end
