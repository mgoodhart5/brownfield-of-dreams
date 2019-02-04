require 'rails_helper'

describe 'As a logged in User' do
  it 'visits /dashboard sees a button to connect to Github', :vcr do
    user = create(:user)

    visit '/'
    click_on "Sign In"
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_on 'Log In'

    expect(page).to have_button("Connect to GitHub")
  end
end
