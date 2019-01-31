require 'rails_helper'

describe 'As a logged in user' do
  it 'when I visit /dashboard I see a Github section', :vcr do
    user = create(:user)
    
    visit '/'
    click_on "Sign In"
    expect(current_path).to eq(login_path)
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)

    within ".github" do
      expect(page).to have_content("Github")
      within(first(".repo")) do
        expect(page).to have_css(".name")
        expect(page).to have_link("little_shop")
      end
    end
  end
end
