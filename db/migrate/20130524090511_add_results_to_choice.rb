class AddResultsToChoice < ActiveRecord::Migration
  def change
    add_column :choices, :resultsjson, :text
  end
end
