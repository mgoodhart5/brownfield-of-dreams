require 'rails_helper'

describe 'As a logged in User' do
  it 'when the user visits /dashboard they see a followers section', :vcr do
    user = create(:token_user)
    auth_hash = {
      :provider => 'github',
      :credentials => { :token => user.token }
    }
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(auth_hash)

    user_followers = Follower.find_all_followers(user)

    visit '/'
    click_on "Sign In"
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_on 'Log In'
    click_on 'Connect to GitHub'

    within ".github_followers" do
      expect(page).to have_content("Followers")
      within(first(".followers")) do
        expect(page).to have_css(".handle")
        expect(page).to have_link(user_followers.first.name)
      end
    end
  end

end
