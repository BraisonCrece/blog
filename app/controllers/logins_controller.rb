class LoginsController < ApplicationController
  def new
    user = User.find_by(id: session[:user_id])
    redirect_to root_path if user
    @user = User.new
  end

  def create
    @user = User.find_by(login_params)

    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = 'Email or password is wrong'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'See you soon!'
  end

  private

  def login_params
    params.require(:user).permit(:name, :email, :password)
  end
end
