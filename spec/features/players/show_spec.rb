require 'rails_helper'

RSpec.describe "Players Show Page", type: :feature do
  describe "As a visitor" do
   before :each do
    @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
    @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
    @player1 = Player.create!(name: "Nathan MacKinno", jersey_number: 29, retired: false, team: @team_2)
    @player2 = Player.create!(name: "Brad Marchand", jersey_number: 63, retired: false, team: @team_1)
   end
    describe "When I visit '/players/:id'" do
      it "Then I see the child with that id including the child's attributes" do
        visit "/players/#{@player1.id}"
        
        expect(page).to have_content(@player1.name)
        expect(page).to have_content(@player1.jersey_number)
        expect(page).to have_content(@player1.retired)
        expect(page).to have_content(@player1.team.name)
        expect(page).to_not have_content(@player2)
      end

      it "Then I see a link to update that Child 'Update Child" do
        visit "/players/#{@player1.id}"

        expect(page).to have_link("Update Player")
      end

      it "When I click the link I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:" do
        visit "/players/#{@player1.id}"
        click_link("Update Player")

        expect(current_path).to eq("/players/#{@player1.id}/edit")
        expect(page).to have_content('Name')
        expect(page).to have_content('Jersey Number')
        expect(page).to have_content('Retired')
      end

      it "When I click the button to submit the form 'Update Child' Then a `PATCH` request is sent to '/child_table_name/:id', the child's data is updated, and I am redirected to the Child Show page where I see the Child's updated information" do
        visit "/players/#{@player1.id}"
        click_link("Update Player")
        expect(current_path).to eq("/players/#{@player1.id}/edit")
        
        fill_in('Name', with: 'Nathan MacKinnon') 
        fill_in('jersey_number', with: 29)
        uncheck('retired')
        click_button('Update Player')

        expect(current_path).to eq("/players/#{@player1.id}")
        expect(page).to have_content("Nathan MacKinnon")
      end
    end
  end
end