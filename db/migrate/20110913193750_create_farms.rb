class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :farms, :user_id
  end
end
