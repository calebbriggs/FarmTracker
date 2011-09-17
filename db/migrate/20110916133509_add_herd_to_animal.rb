class AddHerdToAnimal < ActiveRecord::Migration
  def change
    add_column :animals, :herd_id, :integer
    add_index :animals, :herd_id
  end
end
