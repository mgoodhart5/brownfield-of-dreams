class SearchController < ApplicationController

  def show
    @user_email = Invite.find_email(params[:github_id])
    binding.pry
  end

end
