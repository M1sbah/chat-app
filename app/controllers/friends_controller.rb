class FriendsController < ApplicationController
	def index
		user=User.find(params[:id])
		@added_friends=Friend.where(user_id: user)
		@requested_friends=Friend.where(user_id_2: user)
	    @friends_email=@added_friends.pluck(:email)
		puts @friends_email.inspect
		puts @requested_friends.inspect
		puts "===================="
	end

	def new
		user=User.find(params[:add_friend])
		friend={
			name: user.name,
			age: user.age,
			email: user.email,
			user_id: current_user.id,
			user_id_2: user.id
		}
		@friend=Friend.new(friend)
		@friend.save
		room_id=@friend.rid
		room=Room.find_by(room_id: room_id)
		unless room.present?
			value={
				user_id: @friend.user_id,
				friend_id:@friend.id,
				room_id: room_id
			}
			room=Room.new(value)
			room.save
		end
		puts "=============================="
		puts room.inspect
		puts "=============================="
		redirect_to root_path
	end

	def destroy
		friend_1=Friend.find_by(params[:id])
		friend_2=Friend.find_by(user_id_2: friend_1.user_id)
		room_id=friend_1.rid
		room=Room.find_by(room_id: room_id)

		chat=Message.where(room_id: room.id)

		chat.destroy_all if chat.present?
		room.destroy if room.present?
		friend_2.destroy if friend_2.present?

		friend_1.destroy
		redirect_to friends_index_path(id: current_user.id)
	end
end