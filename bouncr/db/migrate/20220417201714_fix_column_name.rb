class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :organizations, :type, :orgType
  end
end
