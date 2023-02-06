require 'rails_helper'

RSpec.describe 'Teams players index', type: :feature do
  describe 'As a visitor' do
    before :each do
      @team = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
      @joe = @team.players.create!(name: "Joe Sakic", jersey_number: 19, retired: true)
      @nate = @team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false)
      @artturi = @team.players.create!(name: "Artturi Lehkonen", jersey_number: 29, retired: false)
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

      it 'Then I see a link to sort children in alphabetical order' do
        visit "/teams/#{@team.id}/players"

        expect(page).to have_link('Sort Alphabetically', href:"/teams/#{@team.id}/players?alphabetize=true")
      end

      it "When I click on the link
      I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order" do
        visit "/teams/#{@team.id}/players"
        click_link("Sort Alphabetically")

        expect(@artturi.name).to appear_before(@joe.name)
        expect(@joe.name).to appear_before(@nate.name)
        expect(@artturi.name).to appear_before(@nate.name)
        expect(current_path).to eq("/teams/#{@team.id}/players")
      end
    end
  end
end