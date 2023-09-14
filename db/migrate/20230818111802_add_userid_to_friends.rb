class AddUseridToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :user_id_2, :integer
  end
end
