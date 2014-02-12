class PhotosController < ApplicationController

  def new
  end

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @photo_comments = @photo.comments
  end
end
