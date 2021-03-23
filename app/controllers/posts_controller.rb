class PostsController < ApplicationController
  def index
    @posts = Post.all
    @count = Post.count
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @post.save
      flash[:notice] = "ID「#{@post.id}」にスケジュールを登録しました。"
      redirect_to :posts
    else
      render "new"
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:notice] = "ID「#{@post.id}」のスケジュールを編集しました。"
      redirect_to :posts
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "ID「#{@post.id}」のスケジュールを削除しました。"
    redirect_to :posts
  end
  
end
