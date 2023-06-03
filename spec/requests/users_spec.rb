require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'is valid response' do
      get users_path
      expect(response).to have_http_status(200)
    end
    it 'renders correct template' do
      get users_path
      expect(response).to render_template 'users/index'
    end
  end
end
