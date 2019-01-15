class CommentsController < ApplicationController
  before_action :set_post, if: :post_id?
  before_action :set_category, if: :category_id?

  def create
    @comment =
      if post_id?
        @post.comments.new(comment_params)
      elsif category_id?
        @category.comments.new(comment_params)
      end

    @comment.save
  end

  private

  def comment_params
    params.fetch(:comment).permit(:author, :content, :post_id) #:category_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def post_id?
    !!params[:post_id]
  end

  def category_id?
    !!params[:category_id]
  end
end
