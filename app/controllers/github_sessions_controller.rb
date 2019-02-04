class GithubSessionsController < ApplicationController
    def create
      current_user.token = auth_hash["credentials"]["token"]
      current_user.uid = auth_hash["uid"]

      if current_user.save
        session[:logged_in_with_github] = true
      end
      redirect_to dashboard_path
    end

    private

    def auth_hash
      request.env['omniauth.auth']
    end

  end
