module Vision
  class Fetcher
    attr_reader :photo

    def initialize(photo)
      @photo = photo
    end

    def response
      @response ||= Vision::Annotation.new(photo).response
    end

    def call
      ::Annotation.find_or_initialize_by(photo_id: photo.id).tap do |annotation|
        annotation.labels = response.labels
        annotation.faces  = response.faces
        annotation.logos  = response.logos
      end.save
    end
  end
end
