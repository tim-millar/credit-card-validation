# Credit Card Validation Gem

This gem provides some simple credit card validations, in particular of the card type and number. The gem also provides a command line interface, which can be used as follows:

``` shell
credit_card_validation '4408 0412 3456 7893'
```

assuming that the gem has been properly installed and its binaries are available in your shell's path.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'credit_card_validation', git: git@github.com:tim-millar/credit-card-validation.git, branch: master
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install credit_card_validation

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[tim-millar]/credit_card_validation.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
