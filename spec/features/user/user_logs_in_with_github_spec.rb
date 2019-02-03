require "rails_helper"

describe 'User' do
  it 'user can sign into github' do
    VCR.use_cassette("user_attemps_to_sign_into_github") do
      auth_hash = {
        :provider => 'github',
        :credentials => {:token => '12345'}
      }
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(auth_hash)

      user = create(:user)

      visit '/'
      click_on "Sign In"
      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password
      click_on 'Log In'

      click_on "Connect to Github"

      user.reload

      expect(user.token).to eq(auth_hash[:credentials][:token])

      expect(page).to_not have_button("Connect to Github")

      click_on("Log Out")
      expect(current_path).to eq(root_path)

      Capybara.reset_sessions!

      auth_hash_2 = {
        :provider => 'github',
        :credentials => {:token => '55555'}
      }
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(auth_hash_2)

      user_2 = create(:user)

      visit '/'
      click_on "Sign In"
      fill_in 'session[email]', with: user_2.email
      fill_in 'session[password]', with: user_2.password
      click_on 'Log In'

      expect(page).to have_button("Connect to Github")

      click_on "Connect to Github"
    end
  end
end
