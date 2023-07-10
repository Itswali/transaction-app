require 'rails_helper'

RSpec.describe 'splash/splash.html.erb', type: :view do
  context 'when the user is not signed in' do
    before do
      allow(view).to receive(:user_signed_in?).and_return(false)
      render
    end

    it 'does not render the categories/index partial' do
      expect(rendered).not_to render_template(partial: 'categories/index')
    end

    it 'renders the splash container' do
      expect(rendered).to have_selector('.splash-container')
    end

    it 'renders the Sign Up link' do
      expect(rendered).to have_link('Sign Up', href: new_user_registration_path, class: 'sign-up-button')
    end

    it 'renders the Sign In link' do
      expect(rendered).to have_link('Sign In', href: new_user_session_path, class: 'sign-in-button')
    end
  end
end
