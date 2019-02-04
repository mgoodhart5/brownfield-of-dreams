require 'rails_helper'

describe 'As a logged in user when I visit /dashboard' do
  it 'I see an add friend button by another user', :vcr do
    user = create(:token_user)
    user_2 = create(:user, token: "anything", github_id: "mgoodhart5")
    auth_hash = {
      :provider => 'github',
      :info => { :name => 'Name'},
      :credentials => { :token => user.token }
    }
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(auth_hash)

    visit '/'
    click_on "Sign In"
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_on 'Log In'
    click_on 'Connect to GitHub'

    within ".followers" do
      expect(page).to have_content('mgoodhart5')
      expect(page).to have_button('Add to Friends')
    end
  end

end
