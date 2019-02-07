require 'rails_helper'

describe 'As a logged in user when I visit /dashboard' do
  it 'I see an send invite button', :vcr do
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

    expect(page).to have_button("Send an Invite")
  end
  it 'I click send invite button and am taken to /invite', :vcr do
    user = create(:token_user)
    github_handle = "RodneyPerez"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    auth_hash = {
      :provider => 'github',
      :info => { :name => 'Name'},
      :credentials => { :token => user.token }
    }
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(auth_hash)

    click_button("Send an Invite")

    expect(current_path).to eq(invite_path)
    expect(page).to have_content("Send an Invite!")
    fill_in 'github_id', with: github_handle
    expect(page).to have_button("Send Invite")
    click_button("Send Invite")
  end
end


# As a registered user
# When I visit /dashboard
# And I click "Send an Invite"
# Then I should be on /invite
#
# And when I fill in "Github Handle" with <A VALID GITHUB HANDLE>
# And I click on "Send Invite"
# Then I should be on /dashboard
# And I should see a message that says "Successfully sent invite!" (if the user has an email address associated with their github account)
# Or I should see a message that says "The Github user you selected doesn't have an email address associated with their account."
