class ChangePollutionToEnviornment < ActiveRecord::Migration
  def up
    rename_column :cities, :pollution, :enviornment
  end

  def down
  end
end
