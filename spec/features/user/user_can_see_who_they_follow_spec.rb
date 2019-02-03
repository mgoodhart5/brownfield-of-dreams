require 'rails_helper'

describe 'As a logged in User' do
  it 'when the user visits /dashboard they see a following section', :vcr do
    user = create(:token_user)
    auth_hash = {
      :provider => 'github',
      :credentials => {:token => user.token }
    }
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(auth_hash)

    user_following = Following.find_all_followings(user)

    visit '/'
    click_on "Sign In"
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_on 'Log In'
    click_on 'Connect to Github'

    within ".github_following" do
      expect(page).to have_content("Following")
      within(first(".followings")) do
        expect(page).to have_css(".handle")
        expect(page).to have_link(user_following.first.name)
      end
    end
  end

end
