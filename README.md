# Gofl

Play Conway's Game of Life. See details on [wikipedia](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).

## Running

1. `git clone` this repo
2. `bundle`
3. `rake db:setup`
4. `rails s`

Go to `localhost:3000` to play.

## Run tests

Run `rake` to run ruby specs. I tried to decouple as many of the specs as reasonable
from the database and rails in general.

Run `rake test:js` to open [jasmine](http://jasmine.github.io/) specs in browser.

## Plans

1. Default starting configurations
2. Save starting configurations
