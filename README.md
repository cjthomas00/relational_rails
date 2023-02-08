# Hockey Teams and Players

## Ruby version
  2.7.4
## Rails version
  5.2.8
## System dependencies
 - gem 'rails'
 - gem 'pg'
 - gem 'puma'
 - gem 'sass-rails'
 - gem 'uglifier'
 - gem 'coffee-rails'
 - gem 'jbuilder'
 - gem 'bootsnap'
 ### Testing
 - gem 'byebug'
 - gem 'rspec-rails'
 - gem 'simplecov'
 - gem 'capybara'
 - gem 'launchy'
 - gem 'orderly'
 - gem 'shoulda-matchers'
### Development
 - gem 'web-console'
 - gem 'listen'

## Database creation
Hockey Teams {name: string, city: string, original_six_team: boolean, number_of_stanley_cups: integer}

Players {name: string, jersey_number: integer, retired: boolean}

![relational_rails_schema](https://user-images.githubusercontent.com/104170346/217375517-3638bb87-15d8-4100-985e-a074c6eb75cd.png)

## How to run the test suite
1. `bundle install` To add all gems needed.
1. `bundle exec rspec` To run test suite.
