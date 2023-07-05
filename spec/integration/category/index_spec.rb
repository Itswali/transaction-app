require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  before(:each) do
    assign(:categories, [
             Category.create(name: 'Category 1', icon: 'https://cdn-icons-png.flaticon.com/512/4436/4436481.png'),
             Category.create(name: 'Category 2', icon: 'https://cdn-icons-png.flaticon.com/512/4436/4436481.png')
           ])
  end

  it 'displays the "Sign Out" button' do
    render

    expect(rendered).to have_button('Sign Out', type: 'submit', class: 'sign-out-button')
    expect(rendered).to have_css('form[action="' + destroy_user_session_path + '"][method="post"]')
  end

  it 'renders categories' do
    render

    expect(rendered).to have_selector('h1', text: 'Categories')

    expect(rendered).to have_selector('.category', count: 2)

    expect(rendered).to have_selector('.category', text: 'Category 1')
    expect(rendered).to have_selector('.category', text: 'Category 2')

    expect(rendered).to have_css('img[src="https://cdn-icons-png.flaticon.com/512/4436/4436481.png"]')
    expect(rendered).to have_css('img[src="https://cdn-icons-png.flaticon.com/512/4436/4436481.png"]')

    expect(rendered).to have_selector('.category p', text: 'Total Amount:')
    expect(rendered).to have_selector('.category a', text: 'View Transactions')
  end

  it 'displays the "Add a New Category" button' do
    render

    expect(rendered).to have_link('Add a New Category', href: new_category_path, class: 'new_category')
  end

  it 'displays the "Back" link' do
    render

    expect(rendered).to have_link('Back', href: root_path)
  end
end
