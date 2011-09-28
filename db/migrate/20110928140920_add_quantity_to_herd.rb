class AddQuantityToHerd < ActiveRecord::Migration
  def change
    add_column :herds, :quantity, :integer
  end
end
