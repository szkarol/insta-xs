module Vision
  class Response
    attr_reader :annotation

    def initialize(annotation)
      @annotation = annotation
    end

    def labels
      annotation.labels.map(&:description)
    end

    def faces
      if annotation.faces.present?
        face_bounds.map do |vertex|
          vertex.push(vertex[0]).map do |face|
            "#{face.x},#{face.y}"
          end.join(' ')
        end
      else
        []
      end
    end

    def logos
      annotation.logos.map(&:description)
    end

    def landmarks
      annotation.landmarks.flat_map do |landmark|
        landmark.locations.map do |location|
          "#{landmark.description},#{location.latitude},#{location.longitude}"
        end
      end
    end

    private

    def face_bounds
      annotation.faces.each_with_object([]) do |face, memo|
        memo << face.bounds.face
      end
    end
  end
end
