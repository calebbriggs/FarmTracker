class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :tag
      t.string :description
      t.string :sex
      t.string :age
      t.integer :weight
      t.references :farm
      t.string :breed
      t.string :type

      t.timestamps
    end
    add_index :animals, :farm_id
  end
end
