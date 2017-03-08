require "google/cloud/vision"

module Vision extend self
  def client
    @client ||= Google::Cloud::Vision.new project: Figaro.env.vision_project_id
  end
end
