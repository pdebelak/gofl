# Gofl

Play Conway's Game of Life. See details on [wikipedia](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).

## Running

1. `git clone` this repo
2. `bundle`
3. `rake db:setup`
4. `rails s`

Go to `localhost:3000` to play.

## Run tests

Run `rake` to run all ruby and javascript tests. I tried to decouple as many of the tests as reasonable from the database and rails in general. You can run those specs only with `rake test:fast`.

Run `rake test:js` to run just javascript specs in console by themselves. If you want to see the specs in the browser (the console error messages aren't too helpful), you can run `rake test:browser_js`.
