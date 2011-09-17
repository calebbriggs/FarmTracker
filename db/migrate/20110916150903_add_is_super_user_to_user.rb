class AddIsSuperUserToUser < ActiveRecord::Migration
  def change
    add_column :users, :isSuperUser, :boolean
  end
end
