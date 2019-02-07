class ActivationController < ApplicationController

  def create
    user = User.find(params[:user_id])
    user.status = true
    user.save
    flash[:notice] = "Thank you! Your account is now activated!"
    redirect_to dashboard_path
  end

end
