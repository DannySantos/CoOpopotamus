Given(/^there are some games$/) do
  30.times do
    Game.create!(
      title: Faker::Company.name,
      genre: Faker::Company.name,
      online_players: rand(10),
      couch_players: rand(10),
      release_date: Faker::Date.between(10000.days.ago, Date.today)
    )
  end
  
  @marked_game = Game.create!(
    title: Faker::Company.name,
    genre: Faker::Company.name,
    online_players: rand(10),
    couch_players: rand(10),
    release_date: Faker::Date.between(10000.days.ago, Date.today)
  )
end

Given(/^they are on the unmarked games index page$/) do
  visit games_path(page_size: 25, page_number: 1)
end

Given(/^there are some games marked by the user$/) do
  @marked_game_2 = MarkedGame.create!(
    user_id: @user.id,
    game_id: Game.first.id,
    status: 0
  )
  
  @marked_game_3 = MarkedGame.create!(
    user_id: @user.id,
    game_id: Game.last.id,
    status: 1
  )
end

When(/^they visit their games list$/) do
  visit marked_games_path
end

When(/^they mark a game as played$/) do
  find("input", id: "#{Game.first.id}_played").click
end

Then(/^they should only see games they have marked$/) do
  expect(page).to have_content(@marked_game_2.game.title)
  expect(page).to have_content(@marked_game_3.game.title)
  expect(page).not_to have_content(Game.second.title)
  expect(page).not_to have_content(Game.third.title)
  
end

Then(/^the game is marked as played$/) do
  expect(MarkedGame.where(user_id: @user.id, game_id: Game.first.id).first.status).to eq("Played")
end

Then(/^they see a list of unmarked games$/) do
  expect(page).to have_selector('li.game', count: 25)
end

Then(/^they see the first page pagination links$/) do
  expect(page).not_to have_css('a', text: "First")
  expect(page).to have_css('a', text: "Last")
  expect(page).not_to have_css('a', text: "Prev")
  expect(page).to have_css('a', text: "Next")
  expect(page).to have_css('a', text: "2")
  expect(page).not_to have_css('a', text: "1")
end

Then(/^they see the second page pagination links$/) do
  expect(page).to have_css('a', text: "First")
  expect(page).not_to have_css('a', text: "Last")
  expect(page).not_to have_css('a', text: "Next")
  expect(page).to have_css('a', text: "Prev")
  expect(page).to have_css('a', text: "2")
  expect(page).not_to have_css('a', text: "1")
end

Then(/^they see page two of unmarked games$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^they should only see unmarked games$/) do
  expect(page).not_to have_css("input", id: "#{Game.first.id}_played")
end
