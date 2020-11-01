class ToppagesController < ApplicationController
  def index
    if logged_in?
      @photo = current_user.photos.build  # form_with 用
      @photos = current_user.photos.order(id: :desc).page(params[:page])
    end
  end
end
