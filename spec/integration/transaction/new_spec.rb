require 'rails_helper'

RSpec.describe 'transactions/new.html.erb', type: :view do
  before do
    @category = FactoryBot.create(:category)
    @transaction = Transaction.new
    @category_options = [['Category 1', 1], ['Category 2', 2]]
    render
  end

  it 'renders the Back link' do
    expect(rendered).to have_link('Back', href: category_transactions_path(@category), class: 'back-button')
  end

  it 'renders the New Transaction header' do
    expect(rendered).to have_selector('h2.category-h', text: 'New Transaction')
  end

  it 'renders the Sign Out button' do
    expect(rendered).to have_button('Sign Out', type: 'submit', class: 'sign-out-button')
  end

  it 'renders the transaction form' do
    expect(rendered).to have_selector('.new-transaction-container form')

    expect(rendered).to have_selector('.form-header label[hidden]', text: 'Name')
    expect(rendered).to have_selector('.form-header input[type="text"][name="transaction[name]"][placeholder="Transaction Name"]')

    expect(rendered).to have_selector('.form-row label[hidden]', text: 'Amount')
    expect(rendered).to have_selector('.form-row input[type="number"][name="transaction[amount]"][placeholder="Amount"]')

    expect(rendered).to have_selector('.form-row label[hidden]', text: 'Category')
    expect(rendered).to have_selector('.form-row select[name="transaction[category_id]"]')

    expect(rendered).to have_selector('.form-actions input[type="submit"][value="Save"]')
  end
end
