require 'rails_helper'

RSpec.describe '#destroy' do
  describe "As a visitor" do
    before :each do
     @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
     @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
     @player1 = Player.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false, team: @team_2)
     @player2 = Player.create!(name: "Brad Marchand", jersey_number: 63, retired: false, team: @team_1)
    end

   describe "When I visit '/players/:id'" do
    it "Then I see a link to delete the child 'Delete Child'" do
      visit "/players/#{@player1.id}"

      expect(page).to have_link("Delete #{@player1.name}")
    end

    it " When I click the link
    Then a 'DELETE' request is sent to '/child_table_name/:id',
    the child is deleted,
    and I am redirected to the child index page where I no longer see this child" do
      visit "/players/#{@player1.id}"
      click_link("Delete #{@player1.name}")

      expect(current_path).to eq('/players')
      expect(page).to_not have_content(@player1.name)
    end
   end

   describe "When I visit '/players" do
    it "I see a link to delete that child When I click the link" do
      visit "/players"
      click_link("Delete #{@player1.name}")

      expect(current_path).to eq('/players')
      expect(page).to_not have_content(@player1.name)
      expect(page).to have_content(@player2.name)
    end
   end

   describe "When I visit '/players" do
    it "I see a link to delete that child When I click the link" do
      visit "/teams/#{@team_1.id}/players"
      click_link("Delete #{@player2.name}")

      expect(current_path).to eq('/players')
      expect(page).to_not have_content(@player2.name)
      expect(page).to have_content(@player1.name)
      end
    end
  end
end