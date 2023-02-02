# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.destroy_all
Player.destroy_all

team1 = Team.create!(name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6)
team2 = Team.create!(name: 'Blackhawks', city: 'Chicago', original_six_team: true, number_of_stanley_cups: 6) 
team3 = Team.create!(name: 'Red Wings', city: 'Detroit', original_six_team: true, number_of_stanley_cups: 11) 
team4 = Team.create!(name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3) 
player1 = Player.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false, team: team4)
player2 = Player.create!(name: "Brad Marchand", jersey_number: 63, retired: false, team: team1)
player3 = Player.create!(name: "Bobby Orr", jersey_number: 4, retired: true, team: team1)
player4 = Player.create!(name: "Patrick Kane", jersey_number: 88, retired: false, team: team2)
player5 = Player.create!(name: "Stan Mikita", jersey_number: 21, retired: true, team: team2)
player6 = team3.players.create!(name: "Gordie Howe", jersey_number: 9, retired: true)
player7 = team3.players.create!(name: "Steve Yzerman", jersey_number: 19, retired: true)
player8 = team4.players.create!(name: "Joe Sakic", jersey_number: 19, retired: true)

# rails db:{drop,create,migrate,seed}