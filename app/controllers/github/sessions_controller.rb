class Github::SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    GithubToken.find_or_create_from_auth(auth)
    redirect_to dashboard_path
  end


end
