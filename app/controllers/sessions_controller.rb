class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to blog_index_path, notice: "See you soon!"
  end
end