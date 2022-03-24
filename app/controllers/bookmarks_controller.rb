class BookmarksController < ApplicationController
  #before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :chef]

  def new
    @bookmark = List.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
  end

  private
  def set_bookmark
    @bookmark = bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:list).permit(:name)
  end

end
