class SearchController < ApplicationController

  def show
    invite_info = Invite.find_email(params[:github_id])
    if invite_info.email
      UserMailer.invite_email(invite_info)
      flash[:notice] = "Successfully sent invite!"
    else
      flash[:notice] = "The Github user you selected doesn't have an email address associated with their account."
    end
    redirect_to dashboard_path
  end

end
