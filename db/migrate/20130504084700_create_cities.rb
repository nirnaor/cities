class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :transportation
      t.integer :education
      t.integer :costs
      t.integer :security
      t.integer :pollution

      t.timestamps
    end
    add_index :cities, :name, :unique => true
  end
end
