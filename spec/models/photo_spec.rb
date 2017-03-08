require 'rails_helper'

describe Photo, type: :model do
  let(:photo) { create(:photo) }

  describe 'instance' do
    it 'responds to image' do
      expect(photo).to respond_to(:image)
    end
  end
end
