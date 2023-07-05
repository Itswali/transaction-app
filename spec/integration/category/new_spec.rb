require 'rails_helper'

RSpec.describe 'categories/new.html.erb', type: :view do
  before do
    @category = Category.new
    render
  end

  it 'renders the Back link' do
    expect(rendered).to have_link('BACK', href: session.delete(:return_to) || root_path, class: 'back-button')
  end

  it 'renders the New Category header' do
    expect(rendered).to have_selector('h2.category-h', text: 'New Category')
  end

  it 'renders the Sign Out button' do
    expect(rendered).to have_button('Sign Out', type: 'submit', class: 'sign-out-button')
  end

  it 'renders the category form' do
    expect(rendered).to have_selector('form')
    expect(rendered).to have_selector('form[action="/categories"][method="post"]')

    expect(rendered).to have_selector('.form-header label', text: 'Name')
    expect(rendered).to have_selector('.form-header input[type="text"][name="category[name]"]')

    expect(rendered).to have_selector('.form-row label', text: 'Icon')
    expect(rendered).to have_selector('.form-row input[type="text"][name="category[icon]"][placeholder="Icon URL"]')

    expect(rendered).to have_selector('.form-actions input[type="submit"][value="Create Category"]')
  end
end
