class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    photo = Photo.find(params[:photo_id])
    current_user.favorite(photo)
    flash[:success] = '写真をいいね！しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    photo = Photo.find(params[:photo_id])
    current_user.unfavorite(photo)
    flash[:success] = '写真のいいね！を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end