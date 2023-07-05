require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(email: 'user@example.com', password: 'password')
    sign_in @user
  end

  describe 'GET /categories/:category_id/transactions' do
    it 'renders the index template and displays transactions' do
      category = Category.create(name: 'Category', icon: 'icon.png')
      category.transactions.create(name: 'Transaction 1', amount: 10)
      category.transactions.create(name: 'Transaction 2', amount: 20)

      get category_transactions_path(category)

      expect(response).to render_template(:index)

      puts response.body
    end
  end
end
