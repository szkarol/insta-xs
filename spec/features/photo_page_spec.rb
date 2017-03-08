require 'rails_helper'

describe 'visit photo page' do
  before :each do
    @annotation = build(:annotation, labels: FakeVision.annotation_response.labels, faces:  FakeVision.annotation_response.faces)
    @photo      = create(:photo, annotation: @annotation)
    visit photo_url(@photo.id)
  end

  it 'display labels' do
    within('div.tags') do
      expect(page).to have_content "#photography #monochrome-photography"
    end
  end

  it 'show detected faces' do
    within('svg.svg-container') do
      FakeVision.annotation_response.faces.each do |face|
        expect(page).to have_xpath("//polyline[@class='face'][@points='#{face}']")
      end
    end
  end
end
