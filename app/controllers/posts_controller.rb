class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :get_all_categories, :set_current_category, only: %i[new create edit update]

  def show
    @comment = Comment.new
    @comments = @post.comments.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'The post was created!'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'The post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    category = @post.category
    @post.destroy!
    redirect_to category, notice: 'Post was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.fetch(:post).permit(:name, :content, :file, :category_id)
  end

  def get_all_categories
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def set_current_category
    @current_category = params[:category_id]
  end
end
