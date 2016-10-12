class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :origin
      t.float :min_order
      t.decimal :price, precision: 5, scale: 2
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
