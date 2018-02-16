# HomeLoan

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/home_loan`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'au_loan_calculations'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install au_loan_calculations

## Usage

#### How to calculate monthly repayment for a Loan

To calculate the monthly repayment value for a loan call the following class method:

```ruby
AuLoanCalculation::Loan.calculate_monthly_repayment(repayment_type, interest_rate, loan_amount, period=360, iop=0, future_value=0, type=0)
```

#### How to convert an amount frequency

Convert an amount to other frequency:

```ruby
AuLoanCalculation::Parse.convert_amount(amount, frequency, convert_to)
```
The allowed values for **frequency** and **convert_to** are: `weekly`, `fortnightly`, `monthly` and `yearly`.


#### How to calculate the PAYG NET income value

To calculate the PAYG NET income value call the class method:

```ruby
AuLoanCalculation::Income.calculate_payg_net_value(value, year*)
```

The `year` parameter is optional. Its default value is the current year.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/home_loan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HomeLoan project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/home_loan/blob/master/CODE_OF_CONDUCT.md).
