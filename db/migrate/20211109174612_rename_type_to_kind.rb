class RenameTypeToKind < ActiveRecord::Migration[6.1]
  def change
    rename_column :calories, :type, :kind
  end
end
