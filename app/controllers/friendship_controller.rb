class FriendshipController < ApplicationController

  def create
    new_friend = User.find_by(github_id: params[:name])
    if current_user.friends.include?(new_friend)
      flash[:notice] = "You're already friends, try someone else!!"
    else
      current_user.friends << new_friend
      if current_user.save
        flash[:notice] = "You've added a friend!"
      else
        flash[:notice] = "No friends for you!"
      end
    end
    redirect_to dashboard_path
  end
end
