require 'rails_helper'

describe Vision::Annotation do
  before :each do
    photo = double(:photo)
    @vision_annotation = Vision::Annotation.new(photo)
  end

  it 'responds to call' do
    expect(@vision_annotation).to respond_to(:call)
  end

  it 'responds to response' do
    expect(@vision_annotation).to respond_to(:response)
  end
end
