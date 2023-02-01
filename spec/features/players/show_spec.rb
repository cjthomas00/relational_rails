require 'rails_helper'

RSpec.describe "Players Show Page", type: :feature do
  describe "As a visitor" do
    describe "When I visit '/players/:id'" do
      it "Then I see the child with that id including the child's attributes" do
        team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
        team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})

        player1 = Player.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false, team: team_2)
        player2 = Player.create!(name: "Brad Marchand", jersey_number: 63, retired: false, team: team_1)

        visit "/players/#{player1.id}"
        save_and_open_page
        expect(page).to have_content(player1.name)
        expect(page).to have_content(player1.jersey_number)
        expect(page).to have_content(player1.retired)
        expect(page).to have_content(player1.team.name)
        expect(page).to_not have_content(player2)
      end
    end
  end
end