require 'rails_helper'

describe PhotosController, type: :controller do
  describe 'GET #index' do
    it 'renders the :index view' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'populates an array of taxi providers' do
      photo = create(:photo)

      get :index
      expect(assigns(:photos)).to eq([photo])
    end
  end

  describe 'GET #show' do
    before :each do
      @photo      = create(:photo)
      get :show, params: { id: @photo.id }
    end

    it 'renders the :show view' do
      expect(response).to render_template(:show)
    end

    it 'gets photo object' do
      expect(assigns(:photo)).to eq(@photo)
    end
  end

  describe 'POST #photos' do
    before :each do
      @params = { photo: { image: FakePhoto.file } }
      allow_any_instance_of(Vision::Annotation).to receive(:response).and_return(FakeVision.annotation_response)
    end

    it 'creates photo' do
      expect{ post :create, format: :json, params: @params }.to change(Photo, :count).by(1)
    end

    it 'does not redirect to /' do
      post :create, format: :json, params: @params

      expect(response).to_not redirect_to '/'
    end
  end

  describe 'DELETE #photo' do
    before :each do
      @photo  = create(:photo)
      @params = { id: @photo.id }
    end

    it 'deletes photo' do
      expect{ delete :destroy, format: :js, params: @params }.to change(Photo, :count).by(-1)
    end

    it 'broadcast photo delete event' do
      expect(PhotoChannel).to receive(:broadcast_to).with('photos', { action: 'delete', photo_id: @photo.id })

      delete :destroy, format: :js, params: @params
    end
  end
end
