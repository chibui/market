class FixColName < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :approved, :received

  end
end
