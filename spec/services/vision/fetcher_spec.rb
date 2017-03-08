require 'rails_helper'

describe Vision::Fetcher do
  it 'adds photo annotation' do
    photo   = create(:photo)
    fetcher = Vision::Fetcher.new(photo)
    allow(fetcher).to receive(:response).and_return(FakeVision.annotation_response)

    expect{ fetcher.call }.to change(Annotation, :count).by(1)
  end

  it 'updates photo annotation if exists' do
    annotation = build(:annotation, faces: [], labels: [])
    photo      = create(:photo, annotation: annotation)
    fetcher    = Vision::Fetcher.new(photo)
    allow(fetcher).to receive(:response).and_return(FakeVision.annotation_response)

    fetcher.call
    annotation.reload

    expect(annotation.faces).to  eq(FakeVision.annotation_response.faces)
    expect(annotation.labels).to eq(FakeVision.annotation_response.labels)
  end
end
