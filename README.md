# Validator for Singapore NRIC

A standalone NRIC validator as well as ActiveModel validator for use in your Rails models.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validator-nric'
```

## Usage

As a standalone validator:

```ruby
Validator::Nric.check('SXXXXXXXC') # => true or false
```

Use with ActiveModel model:

```ruby
class User < ActiveRecord::Base
  validates :identity_card, nric: true, presence: true, uniqueness: true
end
```

## Credits

* [Wiki on NRIC](http://en.wikipedia.org/wiki/National_Registration_Identity_Card)
* [Fun with numbers](http://www.ngiam.net/NRIC/)
* [All about NRIC number in Singapore](http://www.arjun.com.np/blog/all-about-nric-number-in-singapore/)

## Contributing

1. Fork it ( https://github.com/mech/validator-nric/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
