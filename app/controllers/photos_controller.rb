class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :destroy]

  def index
    @photos = Photo.order_by_created_at
    @new_photo  = Photo.new
  end

  def show
  end

  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        VisionFetcherJob.perform_now(@photo.id)
        format.json { render json: @photo, status: :created }
      else
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    PhotoChannel.broadcast_to('photos', { action: 'delete', photo_id: @photo.id })
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js   { head :no_content}
    end
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:image)
    end
end
