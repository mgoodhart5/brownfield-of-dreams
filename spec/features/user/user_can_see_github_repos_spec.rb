require 'rails_helper'

describe 'A logged in user' do
  it 'when I visit dashboard I should see a section for github' do
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
    expect(page).to have_content("Github")
    within(first(".repo")) do
      expect(page).to have_css(".name")
    end
  end
end
