# Locaweb Twitter

Application that list tweets most relevants and the users who made the most mention of Locaweb.

## Dependencies

- Ruby 2.3.3 version
- Rspec 3.5.0 version
- Sinatra 1.4.8 version

## Installation

Clone it, in project's folder run `bundle install` and run `rackup -p 4567` or `ruby app.rb`.

## Usage

In your browser access `localhost:4567`.

## Tests

For use test run `rspec` in terminal.
The following tests were performed using RSpec:
- Has a version number
- Has a responde HTTP 200
- Does use JSON

## How it was developed 

Firtly, was developed just using ruby, run `bundle gem locaweb-twitter`, but difficulties were encountered starting the server because of .erb files. So it was decided to use the gem Sinatra only to facilitate in that part of the application.
>Of course, it's worth mentioning that it's my first time using Sinatra, so I'm still learning.

For the frond-end, was used Bootstrap and nothing more.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eltonsantos/locaweb-twitter.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).