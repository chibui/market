class AddDefaultToColInOrder < ActiveRecord::Migration[5.0]
  def up
    change_column_default :orders, :shipped, from: nil, to: false
  end

  def up
    change_column_default :orders, :received, from: nil, to: false
  end

end
