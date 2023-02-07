require 'rails_helper'

RSpec.describe '#destroy' do
  describe 'As a visitor' do
    before :each do 
      @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
      @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
      @team_3 = Team.create!({name: 'Wild', city: 'Minnesota', original_six_team: false, number_of_stanley_cups: 0})
      @player1 = Player.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false, team: @team_2)
      @player2 = Player.create!(name: "Joe Sakic", jersey_number: 19, retired: true, team: @team_2)
      @player3 = Player.create!(name: "Marion Gaborik", jersey_number: 10, retired: true, team: @team_3)
      @player4 = Player.create!(name: "Bobby Orr", jersey_number: 4, retired: true, team: @team_1)
      @player5 = Player.create!(name: "Patrice Bergeron", jersey_number: 37, retired: false, team: @team_1)
    end
    describe 'When I visit a parent show page' do
      it 'Then I see a link to delete the parent' do
        visit "/teams/#{@team_1.id}"
        
        expect(page).to have_link("Delete #{@team_1.name}")
      end

      it "When I click the link 'Delete Parent'
      Then a 'DELETE' request is sent to '/parents/:id',
      the parent is deleted, and all child records are deleted
      and I am redirected to the parent index page where I no longer see this parent" do
        visit "/teams/#{@team_1.id}"
        click_link("Delete #{@team_1.name}")

        expect(current_path).to eq("/teams")
        expect(page).to_not have_content(@team_1.name)

        visit "/players"
        expect(page).to_not have_content(@player4.name)
        expect(page).to_not have_content(@player5.name)
      end
    end
  end
end