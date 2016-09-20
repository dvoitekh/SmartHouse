describe UsersController, type: :controller do
  let!(:user) { create :user }
  let!(:device_1) { create :device, user_id: user.id }
  let!(:device_2) { create :device, user_id: user.id }

  before { sign_in user }

  describe 'GET :show' do
    it 'renders user' do
      get :show, params: { id: user.id }, format: :json

      expect(response.body).to be_json_eql user.to_json(include: :devices)
    end
  end

  describe 'GET :edit' do
    it 'renders user edit page' do
      get :edit, params: { id: user.id }

      expect(response.status).to eq 200
    end
  end

  describe 'PUT :update' do
    it 'updates user with valid params' do
      put :update, params: { id: user.id, user: { role: 'client', name: 'new name', email: 'new@example.com', password: 'password', password_confirmation: 'password' } }, format: :json

      expect(response.status).to eq 200
    end

    it 'does not update user with invalid params' do
      put :update, params: { id: user.id, user: { email: 'invalid' } }, format: :json

      expect(response.status).to eq 422
    end
  end
end
