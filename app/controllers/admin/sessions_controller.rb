class Admin::SessionsController < ApplicationController
  def create
    admin = Admin.from_omniauth(request.env["omniauth.auth"])
    if admin
      session[:user_id] = admin.id
      redirect_to admin_admins_path
    else
      flash.now[:alert] = "The email address entered is not registered as an Admin user.  Please contact system admin."
      render "admin/admins/index"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
