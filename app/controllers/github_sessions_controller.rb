class GithubSessionsController < ApplicationController

  def create
    if current_user.token?
      current_user[:token] = auth_hash['credentials']['token']
      current_user.uid = auth_hash['uid']
      # user = User.from_omniauth(env["omniauth.auth"])

    if user.valid?
      session[:user_id] = user.id
      redirect_to request.env['omniauth.origin']
    end
  end

  # def destroy
  #   reset_session
  #   redirect_to request.referer
  # end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
