class ImagesController < ApplicationController

  def index
  end

  def show
  end

  def upload
    @place = Place.find(params[:id])
    place_image = @place.images.build(image: params['file'])
    place_image.save
  end
end
