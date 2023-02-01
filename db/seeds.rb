# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
teams = Team.create!([{name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6}, {name: 'Blackhawks', city: 'Chicago', original_six_team: true, number_of_stanley_cups: 6}, {name: 'Red Wings', city: 'Detroit', original_six_team: true, number_of_stanley_cups: 11}, {name: 'Canadiens', city: 'Montreal', original_six_team: true, number_of_stanley_cups: 25}, {name: 'Rangers', city: 'New York', original_six_team: true, number_of_stanley_cups: 4}, {name: 'Maple Leafs', city: 'Toronto', original_six_team: true, number_of_stanley_cups: 13}, {name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3}, {name: 'Wild', city: 'Minnesota', original_six_team: false, number_of_stanley_cups: 0}  ])