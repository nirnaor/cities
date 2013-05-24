class RenameEnvironmentToEnviornmentInChoice < ActiveRecord::Migration
  def up
    rename_column :choices, :environment, :enviornment
  end

  def down
  end
end
