require 'rails_helper'

RSpec.describe 'Teams players index', type: :feature do
  describe 'As a visitor' do
    before :each do
      @team = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
      @joe = @team.players.create!(name: "Joe Sakic", jersey_number: 19, retired: true)
      @nate = @team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false)
    end

    describe 'When I visit /team/:team_id/players' do
      it 'I see each player that is associated with that team with each players attributes' do
        visit "/teams/#{@team.id}/players"
       
        expect(page).to have_content(@joe.name)
        expect(page).to have_content(@nate.name)
        expect(page).to have_content(@joe.jersey_number)
        expect(page).to have_content(@nate.jersey_number)
        expect(page).to have_content(@joe.retired)
        expect(page).to have_content(@nate.retired)
      end

      it 'Then I see a link to add a new adoptable child for that parent "Create Child"' do
        visit "/teams/#{@team.id}/players"

        expect(page).to have_link('Create Player', href:"/teams/#{@team.id}/players/new")
      end

      it "When I click the link
      I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child" do
        visit "/teams/#{@team.id}/players"

        click_link("Create Player")
        expect(current_path).to eq("/teams/#{@team.id}/players/new")
      end

      it "When I fill in the form with the child's attributes:
      And I click the button 'Create Child'
      Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
      a new child object/row is created for that parent,
      and I am redirected to the Parent Childs Index page where I can see the new child listed" do
        visit "/teams/#{@team.id}/players/new"

        fill_in('name', with: 'Cale Makar') 
        fill_in('jersey_number', with: 8)
        uncheck('retired')
        click_button('Create Player')

        expect(current_path).to eq("/teams/#{@team.id}/players")
        expect(page).to have_content('Cale Makar')
      end

      xit 'Then I see a link to sort children in alphabetical order' do
        visit "/teams/#{@team.id}/players"

        expect(page).to have_link('Sort in Alphabetical Order', href:"/teams/#{@team.id}/players?alphabetical")
      end

      it " Next to every child, I see a link to edit that child's info" do
        visit "/teams/#{@team.id}/players"

        expect(page).to have_content("Update #{@joe.name}")
        expect(page).to have_link("Update #{@joe.name}", href: "/players/#{@joe.id}/edit")
      end

      it "When I click the link
      I should be taken to that `child_table_name` edit page where I can update its information." do 
        visit "/teams/#{@team.id}/players"
        click_link("Update #{@nate.name}")

        expect(current_path).to eq("/players/#{@nate.id}/edit")
        expect(page).to_not have_content(@joe)
      end
    end
  end
end