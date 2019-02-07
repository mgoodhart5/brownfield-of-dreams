require 'rails_helper'

describe 'vister can create an account' do
  it ' visits the home page', :vcr do
    email = 'jimbob@aol.com'
    first_name = 'Jim'
    last_name = 'Bob'
    password = 'password'

    visit '/'

    click_on 'Sign In'

    expect(current_path).to eq(login_path)

    click_on 'Sign up now.'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on'Create Account'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("You are logged in as #{first_name}")
    expect(page).to have_content("Status: Inactive")
    expect(page).to have_content("This account has not yet been activated. Please check your email.")
  end
  it ' visits the activation page and sees it has been activated', :vcr do
    user = create(:user, status: false)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Status: Inactive")

    visit user_status_path(user.id)

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Status: Active")
    expect(user.status).to eq(true)
  end
end
