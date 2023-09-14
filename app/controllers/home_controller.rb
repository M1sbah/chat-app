class HomeController < ApplicationController
  def index
    @users=User.all()
    friends=Friend.where(user_id: current_user)
    @friends_email=friends.pluck(:email)
    puts @friends_email.inspect
    puts "==================="
  end
end
