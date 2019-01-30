class UsersController < ApplicationController
  def show
    the_token = ENV['GITHUB_API_KEY_MF']
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{the_token}"
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("/user/repos")


    @repos = JSON.parse(response.body, symbolize_names: true).take(5)
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
