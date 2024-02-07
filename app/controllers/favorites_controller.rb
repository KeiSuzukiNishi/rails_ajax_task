class FavoritesController < ApplicationController
  before_action :set_blog, only: [:create, :destroy]

  def create
    # binding.pry
    @blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.create(blog_id: @blog.id)
    favorite.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    current_user.favorites.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end