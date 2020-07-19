require 'net/https'
require "open-uri"
class UploaderController < ApplicationController
  def index
    @Img = Img.all
  end
  def create
    @photo = Photo.new(image_params)
    @photo.image = params[:photo][:photo_img].read # params[:モデル名][:カラム名].read
    @photo.save
    redirect_to images_path
  end
  
  private
  
  def image_params
    params.require(:photo).permit(:photo_name, :photo_img)
  end
end