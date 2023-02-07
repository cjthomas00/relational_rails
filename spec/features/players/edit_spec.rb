require 'rails_helper'

RSpec.describe 'Edit Player', type: :feature do
  describe "As a visitor" do
    before :each do 
      @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
      @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
  
      @player1 = Player.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false, team: @team_2)
      @player2 = Player.create!(name: "Brad Marchand", jersey_number: 63, retired: false, team: @team_1)
      @player3 = Player.create!(name: "Joe Sakic", jersey_number: 19, retired: true, team: @team_2)
      @player4 = Player.create!(name: "Ray Bourque", jersey_number: 77, retired: true, team: @team_1)
    end

    describe "When I visit '/players/:id'" do
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

    describe "when I visit '/players'" do
      it " Next to every child, I see a link to edit that child's info" do
        visit '/players'
      
        expect(page).to have_content("Update #{@player1.name}")
        expect(page).to have_link("Update #{@player1.name}", href: "/players/#{@player1.id}/edit")
      end
      
      it "When I click the link
      I should be taken to that `child_table_name` edit page where I can update its information." do 
        visit '/players'
        click_link("Update #{@player1.name}")
      
        expect(current_path).to eq("/players/#{@player1.id}/edit")
        expect(page).to_not have_content(@player3)
      end
    end
  end
end
