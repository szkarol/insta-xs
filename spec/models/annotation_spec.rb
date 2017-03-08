require 'rails_helper'

describe Annotation, type: :model do
  let(:annotation) { build(:annotation) }

  describe 'instance' do
    it { should validate_presence_of(:photo) }
    it { should belong_to(:photo) }

    it 'responds to faces' do
      expect(annotation).to respond_to(:faces)
    end

    it 'responds to labels' do
      expect(annotation).to respond_to(:labels)
    end
  end
end
