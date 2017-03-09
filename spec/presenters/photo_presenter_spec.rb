require 'rails_helper'

describe PhotoPresenter do
  before :each do
    @annotation      = build(:annotation)
    @photo           = build(:photo, annotation: @annotation)
    @photo_presenter = PhotoPresenter.new(@photo)
  end

  it 'returns empty string if labels blank' do
    expect(@photo_presenter.labels_to_str).to be_empty
  end

  it 'converts labels array to string with tags if labels present' do
    @annotation.labels = ["people", "photograph", "black and white"]

    expect(@photo_presenter.labels_to_str).to eq("#people #photograph #black-and-white")
  end

  it 'show_faces? returns true if faces present' do
    @annotation.faces = ["476,54 531,54 531,109 476,109 476,54"]

    expect(@photo_presenter.show_faces?).to be true
  end

  it 'show_faces? returns false if faces blank' do
    expect(@photo_presenter.show_faces?).to be false
  end

  it 'show_faces? returns false if annotation blank' do
    @photo.annotation = nil

    expect(@photo_presenter.show_faces?).to be false
  end

  it 'responds to photo attributes' do
    %w(image created_at annotation).each do |attr|
      expect(@photo_presenter).to respond_to(attr)
    end
  end

  it 'returns amazone search url' do
    expect(@photo_presenter.amazone_search_url("Reebok")).to eq('https://www.amazon.com/s?field-keywords=Reebok')
  end

  it 'returns google maps url' do
    params = @photo_presenter.google_maps_params("Eiffel Tower,48.858461,2.294351")

    expect(params[:description]).to eq('Eiffel Tower')
    expect(params[:url]).to         eq('http://www.google.com/maps/place/48.858461,2.294351')
  end
end
