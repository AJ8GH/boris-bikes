# Boris Bikes
[![Maintainability](https://api.codeclimate.com/v1/badges/bbd400a9900bd0949e92/maintainability)](https://codeclimate.com/github/AJ8GH/boris-bikes/maintainability) [![Build Status](https://travis-ci.com/AJ8GH/boris-bikes.svg?branch=main)](https://travis-ci.com/AJ8GH/boris-bikes) [![Coverage Status](https://coveralls.io/repos/github/AJ8GH/boris-bikes/badge.svg?branch=main)](https://coveralls.io/github/AJ8GH/boris-bikes?branch=main)

## _Software solutions for TFL_

![Boris & Arnie](https://images.theconversation.com/files/35320/original/zss3jzhn-1384451954.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip)

## Concepts

### Domain Modeling

The solution was realised by modeling a number of [user stories](https://github.com/AJ8GH/boris-bikes/blob/main/user_stories.md) from our client. Paying close attention to the desired behaviour of our users was key to the success of the project.

### TDD

Everything in our solution has been test driven, to ensure our code is well designed and easily maintainable.

### Pair Programming

Pairing allowed difficult problems to be solved at twice the speed.

## Getting Started

Clone this repo
- `git clone git@github.com:AJ8GH/airport_challenge.git`

Run boris_bikes.rb script in a REPL environment from root directory
- `irb -r ./lib/boris_bikes.rb`

Explore the funcitionality of Bikes, Docking Stations, Garages and Repair Vans.

## Testing

Run tests using RSpec:
- `rspec`
- `rspec -fd` - for documentation format of tests

## Dependencies
- `rspec` - testing
- `coveralls` - test coverage
- `rake` - CI
