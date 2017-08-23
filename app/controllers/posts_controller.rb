class PostsController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if (@post.save)
      redirect_to action: :show, id: @post.id
    else
      Rails.logger.debug(@post.errors.inspect)
      flash[:alert] = 'Post olusturulurken hata oldu'
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if (@post.update(post_params))
      redirect_to action: :show, id: @post.id
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, category_ids: [])
  end
end
