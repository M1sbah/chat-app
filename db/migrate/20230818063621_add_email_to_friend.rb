class AddEmailToFriend < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :email, :string
  end
end
