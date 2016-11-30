class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
      t.references :user
      t.string :name
      t.string :url
      t.timestamps
    end
  end
end
