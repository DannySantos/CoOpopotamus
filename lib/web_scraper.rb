require 'watir'

browser = Watir::Browser.new
browser.goto 'http://www.co-optimus.com/games.php'

browser.div(id: "system-modal").link(class: "close-reveal-modal").click
browser.select_list(:id, "system").select("PC")
browser.link(text: "Find Games").click

until browser.link(text: "Next").exists? == false
  rows = browser.trs(class: "result_row")

  rows.each do |row|
    @title = row.td(index: 0).strong.text
    @genre = row.td(index: 0).label.text
    @online_players = row.td(index: 1).text.to_i
    @couch_players = row.td(index: 2).text.to_i

    if row.td(index: 6).span.exists?
      date = row.td(index: 6).span.text
      @release_date = Date::strptime(date, "%m/%d/%Y")
    end

    Game.find_or_create_by(
      title: @title,
      genre: @genre,
      online_players: @online_players,
      couch_players: @couch_players,
      release_date: @release_date
    )
  end

  browser.link(text: "Next").click

  sleep 5
end