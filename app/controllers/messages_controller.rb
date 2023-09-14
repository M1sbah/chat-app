class MessagesController < ApplicationController
	# @fid=nil
	def show
		# byebug
		@message=Message.new
		# @friend=Friend.find_by(id: params[:id])
		@friend=Friend.find(params[:id])
		@fid=params[:id]
		@room=Room.find_by(room_id: @friend.rid)
		# puts @friend.inspect
	end
	def new
		@message=Message.new
	end
	def create
		# byebug
		user = current_user

		# puts "-----------------------1"
		# # puts params.inspect
		# puts params[:content]
		# puts params[:user_id]
		# puts params[:room_id]
		# value={
		# 	content: params[:content],
		# 	user_id: params[:user_id],
		# 	room_id: params[:room_id]
		# }
		# puts "-----------------------2"
		@message=Message.new(message_params)
		# @school = School.new(school_params)
		# message.inspect
		@message.save!

		redirect_to messages_path(id: @fid)
	end

	private
	def message_params
		params.require(:message).permit(:content, :user_id, :room_id)
	end

end