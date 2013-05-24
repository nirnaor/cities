class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :environment
      t.integer :costs
      t.integer :education
      t.integer :security
      t.integer :transportation

      t.timestamps
    end
  end
end
