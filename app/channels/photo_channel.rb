class PhotoChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'photo:photos'
  end

  def create(data)
    ActionCable.server.broadcast('photo:photos',
      {
        action: data['action'],
        photo:  render_photo(data['photo'])
      }
    )
  end

  def delete(data)
    ActionCable.server.broadcast('photo:photos',
      {
        action: data['action'],
        photo:  data['photo']
      }
    )
  end

  private

  def render_photo(photo)
    ApplicationController.render(partial: 'photos/photo_element', locals: { photo: Photo.find(photo["id"]) })
  end
end
