require 'rails_helper'

RSpec.describe 'the teams show page', type: :feature do
  describe "As a visitor" do
    before :each do 
      @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
      @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
      @team_3 = Team.create!({name: 'Wild', city: 'Minnesota', original_six_team: false, number_of_stanley_cups: 0})
      @player1 = Player.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false, team: @team_2)
      @player2 = Player.create!(name: "Joe Sakic", jersey_number: 19, retired: true, team: @team_2)
      @player3 = Player.create!(name: "Marion Gaborik", jersey_number: 10, retired: true, team: @team_3)
      @player4 = Player.create!(name: "Bobby Orr", jersey_number: 4, retired: true, team: @team_1)
    end
    describe "When I visit '/teams/:id" do
      it 'Then I see the parent with that id including the parents attributes' do  
        visit "/teams/#{@team_1.id}"
      
        expect(page).to have_content(@team_1.name)
        expect(page).to have_content(@team_1.city)
        expect(page).to_not have_content(@team_2)
      end

      it 'I see a count of the number of children associated with this parent' do
          visit "/teams/#{@team_1.id}"
          
          expect(page).to have_content(@team_1.player_count)
          expect(page).to_not have_content(@team_2)
      end

      it 'Then I see a link to take me to that parents `child_table_name` page' do
        visit "/teams/#{@team_1.id}"
        
        expect(page).to have_link('Players', href:"/teams/#{@team_1.id}/players")

        click_link('Players')
        expect(current_path).to eq("/teams/#{@team_1.id}/players")
      end
    end
  end
end