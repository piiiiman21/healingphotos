class PhotosController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  
  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      flash[:success] = '画像を投稿しました。'
      redirect_to root_url
    else
      @photos = current_user.photos.order(id: :desc).page(params[:page])
      flash.now[:danger] = '画像の投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @photo.destroy
    flash[:success] = '画像を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update params.require(:photo).permit(:title, :content) # POINT
    redirect_to root_url
  end
  
  private

  def photo_params
    params.require(:photo).permit(:title, :content)
  end
  
  def correct_user
    @photo = current_user.photos.find_by(id: params[:id])
    unless @photo
      redirect_to root_url
    end
  end
end