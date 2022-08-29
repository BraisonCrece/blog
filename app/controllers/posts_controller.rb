class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.valid?
      @post.save
      redirect_to blog_index_path, notice: "Post successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post.user_id = current_user.id
    if @post.update(post_params)
      redirect_to blog_index_path, notice: "Post successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @post.destroy
    redirect_to blog_index_path, notice: "Post successfully deleted"
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def current_user
      User.find(session[:user_id])
    end
end