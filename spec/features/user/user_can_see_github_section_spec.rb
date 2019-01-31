require 'rails_helper'

describe 'As a logged in user' do
  it 'When I visit /dashboard I see a Github section for Repos' do
    VCR.use_cassette("user_can_create_account_then_see_repo") do
      filename = "github_repos.json"
      url = "https://api.github.com/user/repos"
      stub_get_json(url, filename)

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
        within(first(".repos")) do
          expect(page).to have_css(".repo_name")
          expect(page).to have_link("little_shop")
        end
      end
    end
  end

  it 'When I visit /dashboard I see a Github section for Followers' do
    VCR.use_cassette("user_can_create_account_then_see_followers") do
      filename = "github_followers.json"
      url = "https://api.github.com/user/followers"
      stub_get_json(url, filename)

      user = create(:user)

      visit '/'

      click_on "Sign In"

      expect(current_path).to eq(login_path)

      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password

      click_on 'Log In'

      expect(current_path).to eq(dashboard_path)

      within ".github" do
        expect(page).to have_content("Followers")
      end

      within(first(".followers")) do
        expect(page).to have_link("abroberts5")
      end
    end
  end

end

# And I should see list of all followers with their handles linking to their Github profile
