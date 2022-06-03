class HomeController < ApplicationController
  def index
    #@users = User.all.sort
    @friendship = Friendship.new
    if user_signed_in?
      @users = Array.new
      @requests = Array.new
      @pending = Array.new
      @friends = Array.new
      current_user.befriendee_friendships.each do |friendship|
        if (friendship.confirmed == nil)
          @requests << User.find(friendship.befriendor_id)
        else
          @friends << User.find(friendship.befriendor_id)
        end
      end
      current_user.befriendor_friendships.each do |friendship|
        if (friendship.confirmed == nil)
          @pending << User.find(friendship.befriendee_id)
        else
          @friends << User.find(friendship.befriendee_id)
        end
      end
      User.all.each do |u|
        if (u != current_user)
          unless current_user.friends.include?(u)
            @users << u
          end
        end
      end
      @users = @users.sort
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
