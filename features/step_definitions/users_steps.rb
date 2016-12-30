Given(/^they are on the registration page$/) do
  visit new_user_registration_path
end

Given(/^a User has previously registered$/) do
  @user = User.create!(
    {
      email: "test@test.com",
      password: "password",
      password_confirmation: "password"
    }
  )
end

Given(/^they are on the log in page$/) do
  visit new_user_session_path
end

Given(/^they have signed in previously$/) do
  steps %{
    Given they are on the log in page
    When they fill in the "user_email" field with "test@test.com"
      And they fill in the "user_password" field with "password"
      And they click on "Log in"
  }
end

Given(/^they are on the home page$/) do
  visit root_path
end

Then(/^they are logged in$/) do
  expect(page).to have_content("Signed in successfully.")
end

Then(/^a User should be created$/) do
  expect(User.last.email).to eq('test@test.com')
end

Then(/^they should see a farewell message$/) do
  expect(page).to have_content("Signed out successfully.")
end