class AddImageToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :item_image, :string
  end
end
