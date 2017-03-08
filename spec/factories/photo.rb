FactoryGirl.define do
  factory :photo do
    image { Rack::Test::UploadedFile.new(FakePhoto.path) }
  end
end
