class FriendshipController < ApplicationController

  def create
    new_friend = User.find_by(github_id: params[:name])
    current_user.friends << new_friend
    # @friendship = Follow.new({follower_id: current_user.id, followee_id: new_friend.id})
    # binding.pry
    # @friendship = current_user.follows.build(:followee_id => new_friend.id)
    if current_user.save
      flash[:notice] = "You've added a friend!"
    else
      flash[:notice] = "No friends for you!"
    end
    redirect_to dashboard_path
  end
end
