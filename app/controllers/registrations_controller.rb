class RegistrationsController < ApplicationController
  def new
    user = User.find_by(id: session[:user_id])
    redirect_to blog_index_path if user
    @user = User.new 
  end

  def create
    @user = User.new(user_params)

   if @user.save
    redirect_to new_login_path
   else
    flash[:alert] = "Couldn't save the user!"
    render :new, status: :unprocessable_entity
   end
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password)
    end
end