require 'rails_helper'

describe 'As a logged in user' do
  it 'when I visit /dashboard I see a Github section' do
    filename = "github_repos.json"
    url = "https://api.github.com/user/repos"
    stub_get_json(url, filename)

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(user).and_return(current_user)

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Github")
  end

end
