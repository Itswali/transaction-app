require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    # Create a user and sign in
    @user = User.create(email: 'user@example.com', password: 'password')
    sign_in @user
  end

  describe 'GET /categories/:category_id/transactions' do
    it 'renders the index template and displays transactions' do
      # Create a category and some transactions for testing
      category = Category.create(name: 'Category', icon: 'icon.png')
      category.transactions.create(name: 'Transaction 1', amount: 10)
      category.transactions.create(name: 'Transaction 2', amount: 20)

      # Make the request
      get category_transactions_path(category)

      expect(response).to render_template(:index)

      # Output the response body for inspection
      puts response.body

      # Add the existing assertions

      # Add more assertions as needed
    end
  end

  # Add more tests for other actions if required
end
