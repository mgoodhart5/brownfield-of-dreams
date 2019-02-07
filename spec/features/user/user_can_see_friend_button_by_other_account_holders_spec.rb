require 'rails_helper'

describe 'As a logged in user when I visit /dashboard' do
  it 'I see an add friend button by another user', :vcr do
    user = create(:token_user)
    user_2 = create(:user, token: "anything", github_id: "abroberts5")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit dashboard_path

    auth_hash = {
      :provider => 'github',
      :info => { :name => 'Name'},
      :credentials => { :token => user.token }
    }
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(auth_hash)

    within ".follower-0" do
      expect(page).to have_content(user_2.github_id)
      expect(page).to have_button('Add to Friends')
      click_on 'Add to Friends'
    end

    expect(current_path).to eq(dashboard_path)
    within(".primary_nav") do
      expect(page).to have_content("Friend Count: 1")
    end
  end

end
