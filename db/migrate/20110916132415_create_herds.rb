class CreateHerds < ActiveRecord::Migration
  def change
    create_table :herds do |t|
      t.string :name
      t.string :description
      t.references :farm

      t.timestamps
    end
    add_index :herds, :farm_id
  end
end
