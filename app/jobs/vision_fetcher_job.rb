class VisionFetcherJob < ApplicationJob
  queue_as :vision_fetcher

  def perform(photo_id)
    photo = Photo.find(photo_id)
    Vision::Fetcher.new(photo).call
  end
end
