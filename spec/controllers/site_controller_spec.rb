describe SiteController, type: :controller do
  describe 'GET :index' do
  it 'renders index page' do
    get :index

    expect(response.status).to eq 200
    expect(subject).to render_template :index
  end
end
end
