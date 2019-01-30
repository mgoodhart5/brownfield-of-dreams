require 'rails_helper'

describe 'As a User' do
  it 'When I visit /dashboard I sees a GitHub section' do
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
      expect(find('ul.repo')).to have_selector('li', count: 5)
      within "#repo-#{user.repos[0].id}"
        expect(page).to have_link(user.repos[0].name, href: "#{user.repos[0]}")
      end
      # repeat the above test (including the within block) ~5 times
    end
  end

# API call uses: https://developer.github.com/v3/repos/#list-your-repositories
#  API call DOES NOT use: https://developer.github.com/v3/repos/#list-user-repositories
#  No hashes in the view.
#  Uses objects in the view to represent the Repos.
#  Edge case: Make sure this shows the proper repositories when there are more
# than one user in the database with different tokens. (look at Anna's slack)
#  Don't display the "Github" section if the user is missing a Github token
