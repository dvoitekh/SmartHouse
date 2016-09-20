describe DevicesController, type: :controller do
  let(:user) { create :user }
  let!(:device) { create :device, user: user }
  let!(:category) { create :category }

  before { sign_in user }

  describe 'POST :create' do
    it 'creates device with valid params' do
      post :create, params: { device: { user_id: user.id, bt_mac_address: '1234567', category_id: category.id, name: 'new name', power: '1.25', validity: true, active: true } }, format: :json

      expect(response.status).to eql 200
    end

    it 'does not create device with invalid params' do
      post :create, params: { device: { user_id: user.id } }, format: :json

      expect(response.status).to eql 422
    end
  end

  describe 'GET :show' do
    it 'renders device' do
      get :show, params: { id: device.id }, format: :json

      expect(response.body).to be_json_eql device.to_json
    end
  end

  describe 'GET :edit' do
    it 'renders device form' do
      get :edit, params: { id: device.id }

      expect(response.status).to eql 200
    end
  end

  describe 'PUT :update' do
    it 'updates device with valid params' do
      put :update, params: { id: device.id, device: { name: 'new name' } }, format: :json

      expect(response.status).to eql 200
      expect(response.body).to eql ''
    end

    it 'does not update device with invalid params' do
      put :update, params: { id: device.id, device: { name: '' } }, format: :json

      expect(response.status).to eql 422
    end
  end

  describe 'DELETE :destroy' do
    it 'deletes device' do
      delete :destroy, params: { id: device.id }, format: :json

      expect(response.status).to eql 200
      expect(response.body).to eql ''
    end
  end
end
