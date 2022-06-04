class HomeController < ApplicationController
  def index
    @friendship = Friendship.new
    @saying = Saying.new
    @sayings = Saying.all
    @relavent_sayings = Array.new

    

    if user_signed_in?
      @users = Array.new
      @requests = Array.new
      @pending = Array.new
      @friends = Array.new

      current_user.befriendee_friendships.each do |friendship|
        if (friendship.confirmed == nil)
          @requests << friendship
        else
          @friends << User.find(friendship.befriendor_id)
        end
      end

      current_user.befriendor_friendships.each do |friendship|
        if (friendship.confirmed == nil)
          @pending << friendship
        else
          @friends << User.find(friendship.befriendee_id)
        end
      end

      @sayings.each do |saying|
        if (@friends.include?(saying.user)) || (current_user == saying.user)
          @relavent_sayings << saying
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
