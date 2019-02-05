class UsersController < ApplicationController
  def show
    if current_user.token && current_user.token_valid?
      @repos = Repo.find_all_repos(current_user)
      @followers = Follower.find_all_followers(current_user)
      @followings = Following.find_all_followings(current_user)
    end
    @my_videos = current_user.bookmark_videos
    # binding.pry
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
