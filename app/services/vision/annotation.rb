module Vision
  class Annotation
    attr_reader :photo, :client

    def initialize(photo, client=Vision.client)
      @photo  = photo
      @client = client
    end

    def call
      client.annotate image, faces: true, labels: true, logos: true, landmarks: true
    end

    def response
      Vision::Response.new(self.call)
    end

    private

    def image
      client.image(bucket_path)
    end

    def image_path
      photo.image.big.path
    end

    def bucket_path
      "gs://#{Figaro.env.bucket_name}/#{image_path}"
    end
  end
end
