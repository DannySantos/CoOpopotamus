Given(/^they are on the registration page$/) do
  visit new_user_registration_path
end

Given(/^a user has previously registered$/) do
  @user = User.create!({
    email: "test@test.com",
    password: "password",
    password_confirmation: "password"
  })
end

Given(/^they are on the sign in page$/) do
  visit new_user_session_path
end

Given(/^they have signed in previously$/) do
  steps %{
    Given they are on the sign in page
    When they fill in the sign in form
  }
end

Given(/^they are on the home page$/) do
  visit root_path
end

When(/^they fill in the sign in form$/) do
  fill_in :user_email, with: "test@test.com"
  fill_in :user_password, with: "password"
  click_on "Log in"
end

When(/^they fill in the user registration form$/) do
  fill_in :user_email, with: "test@test.com"
  fill_in :user_password, with: "password"
  fill_in :user_password_confirmation, with: "password"
  click_on "Sign up"
end

Then(/^they are signed out$/) do
  expect(page).to have_content("Signed out successfully.")
end

Then(/^they are signed in$/) do
  expect(page).to have_content("Signed in successfully.")
end

Then(/^a user should be created$/) do
  expect(User.last.email).to eq('test@test.com')
end
