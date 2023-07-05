require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before do
    @user = User.create(email: 'user@example.com', password: 'password')

    post user_session_path, params: { user: { email: @user.email, password: @user.password } }
  end

  describe 'GET /categories' do
    it 'renders the index template and displays categories' do
      # Create some categories for testing
      category1 = Category.create(name: 'Category 1', icon: 'https://cdn-icons-png.flaticon.com/512/4436/4436481.png')
      category2 = Category.create(name: 'Category 2', icon: 'https://cdn-icons-png.flaticon.com/512/4436/4436481.png')

      # Make the request
      get categories_path

      expect(response).to render_template(:index)

      # Assert that the categories are displayed in the response body
      expect(response.body).to include(category1.name)
      expect(response.body).to include(category2.name)

      # Add more assertions as needed
    end
  end
end
