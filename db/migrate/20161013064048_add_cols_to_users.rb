class AddColsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :business_name, :string
    add_column :users, :contact, :string
    add_column :users, :phone, :string
    add_column :users, :address, :text
    add_column :users, :abn, :string
    add_column :users, :bio, :text
    add_column :users, :tos_status, :boolean
  end
end
