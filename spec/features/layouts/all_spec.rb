require 'rails_helper'

RSpec.describe 'All Pages' do
  describe 'As a visitor' do
    describe 'When I visit any page' do
      it 'I see a link for the child index' do
        team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
        player1 = Player.create!(name: "Bobby Orr", jersey_number: 4, retired: true, team: team_1)
        
        visit "/teams"
        expect(page).to have_link('Players Index', href: '/players')
        visit "/teams/#{team_1.id}"
        expect(page).to have_link('Players Index', href: '/players')
        visit "/teams/#{team_1.id}/players"
        expect(page).to have_link('Players Index', href: '/players')
        visit "/players"
        expect(page).to have_link('Players Index', href: '/players')
        visit "/players/#{player1.id}"
        expect(page).to have_link('Players Index', href: '/players')
      end

      it 'I see a link for the parent index' do
        team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
        player1 = Player.create!(name: "Bobby Orr", jersey_number: 4, retired: true, team: team_1)
        
        visit "/teams"
        expect(page).to have_link('Teams Index', href: '/teams')
        visit "/teams/#{team_1.id}"
        expect(page).to have_link('Teams Index', href: '/teams')
        visit "/teams/#{team_1.id}/players"
        expect(page).to have_link('Teams Index', href: '/teams')
        visit "/players"
        expect(page).to have_link('Teams Index', href: '/teams')
        visit "/players/#{player1.id}"
        expect(page).to have_link('Teams Index', href: '/teams')
      end
    end
  end
end