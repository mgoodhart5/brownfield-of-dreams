require 'rails_helper'

describe 'As a logged in User' do
  it 'when the user visits /dashboard they see a button to connect to github section', :vcr do
    user = create(:user)

    visit '/'
    click_on "Sign In"
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_on 'Log In'


    expect(page).to have_button("Connect to Github")
  end
  # it 'can click on github button' do
  #   user = create(:user)
  #
  # end
end

# As a user
# When I visit /dashboard
# Then I should see a link that is styled like a button that says "Connect to Github"
# And when I click on "Connect to Github"
# Then I should go through the OAuth process
# And I should be redirected to /dashboard
# And I should see all of the content from the previous Github stories (repos, followers, and following)
