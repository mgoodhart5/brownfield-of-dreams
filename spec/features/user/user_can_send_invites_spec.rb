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
  it 'I click send invite button and am taken to /invite NIL email', :vcr do
    user = create(:token_user)
    github_handle = "le3ah"

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
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("The Github user you selected doesn't have an email address associated with their account.")
  end
  it 'I click send invite button and am taken to /invite public email', :vcr do
    user = create(:token_user)
    github_handle = "justinmauldin7"

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
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Successfully sent invite!")
  end
end
