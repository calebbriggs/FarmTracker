class AddAcresToFarm < ActiveRecord::Migration
  def change
    add_column :farms, :acres, :integer
  end
end
