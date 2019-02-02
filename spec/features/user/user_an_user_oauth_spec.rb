require 'rails_helper'


describe 'As a logged in user' do
  it 'when I visit /dashboard I see a Github section', :vcr do
    user = create(:user)


    visit '/'
    click_on "Sign In"
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_button("Connect to Github")
  end
end



# As a user
# When I visit /dashboard

# Then I should see a link that is styled like a button that says "Connect to Github"

# And when I click on "Connect to Github"
# Then I should go through the OAuth process
# And I should be redirected to /dashboard
# And I should see all of the content from the previous Github stories (repos, followers, and following)
