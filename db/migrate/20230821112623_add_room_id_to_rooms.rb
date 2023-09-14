class AddRoomIdToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :room_id, :integer
  end
end
