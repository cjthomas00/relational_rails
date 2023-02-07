require 'rails_helper'

RSpec.describe 'the players index page', type: :feature do
  describe "As a visitor" do
    before :each do 
      @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
      @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
  
      @player1 = Player.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false, team: @team_2)
      @player2 = Player.create!(name: "Brad Marchand", jersey_number: 63, retired: false, team: @team_1)
      @player3 = Player.create!(name: "Joe Sakic", jersey_number: 19, retired: true, team: @team_2)
      @player4 = Player.create!(name: "Ray Bourque", jersey_number: 77, retired: true, team: @team_1)
    end
    describe "when I visit '/players'" do
      it 'displays the players and their attributes' do
        visit '/players'
        
        expect(page).to have_content(@player1.name)
        expect(page).to have_content(@player2.name)
        expect(page).to have_content(@player1.jersey_number)
        expect(page).to have_content(@player2.jersey_number)
        expect(page).to have_content(@player1.retired)
        expect(page).to have_content(@player2.retired)
        expect(page).to have_content(@player1.team.name)
        expect(page).to have_content(@player2.team.name)
      end

      it 'only shows active players' do
        visit '/players'

        expect(page).to have_content(@player1.name)
        expect(page).to have_content(@player2.name)
        expect(page).to have_content(@player1.jersey_number)
        expect(page).to have_content(@player2.jersey_number)
        expect(page).to have_content(@player1.retired)
        expect(page).to have_content(@player2.retired)
        expect(page).to have_content(@player1.team.name)
        expect(page).to have_content(@player2.team.name)
        
        expect(page).to_not have_content(@player3.name)
        expect(page).to_not have_content(@player4.name)
        expect(page).to_not have_content(@player3.jersey_number)
        expect(page).to_not have_content(@player4.jersey_number)
        expect(page).to_not have_content(@player3.retired)
        expect(page).to_not have_content(@player4.retired)
      end

      it "Next to every player, I see a link to delete that player" do
        visit '/players'

        expect(page).to have_link("Delete #{@player1.name}")
        expect(page).to have_link("Delete #{@player2.name}")
      end
    end
  end
end