require 'rails_helper'

describe Vision::Response do
  before :each do
    @vision_response = Vision::Response.new(FakeVision.annotation)
  end

  it 'extracts labels' do
    expect(@vision_response.labels).to eq(['people', 'black and white', 'people'])
  end

  it 'extracts faces' do
    expect(@vision_response.faces).to eq(["476,54 531,54 531,109 476,109 476,54", "235,40 293,40 293,97 235,97 235,40"])
  end

  it 'returns empty array if faces blank' do
    @vision_response.annotation.faces = []

    expect(@vision_response.faces).to be_empty
  end

  it 'extracts logos' do
    expect(@vision_response.logos).to eq(["Abibas", "Sofixy"])
  end

  it 'returns empty array if logos blank' do
    @vision_response.annotation.logos = []

    expect(@vision_response.logos).to be_empty
  end
end
