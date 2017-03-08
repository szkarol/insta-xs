require 'rails_helper'

describe 'homepage' do
  before :each do
    visit '/'
  end

  it 'display logo link' do
    within('div.navbar-header') do
      expect(page).to have_css     'a.navbar-brand'
      expect(page).to have_content 'Insta-XS'
    end
  end

  it 'contains dropzone element', js: true do
    within('div.jumbotron.photo-form') do
      expect(page).to have_css     '.dropzone'
      expect(page).to have_content 'Drop files'
      expect(page).to have_css     'form#new_photo'
    end
  end
end
