module AuLoanCalculation
  class Parse

    # the amount to be converted.
    # the current frequency - allowed values: weekly, fortnightly, monthly, yearly
    # the frequency the amount should be converted - allowed values: weekly, fortnightly, monthly, yearly
    def self.convert_amount(amount, frequency, convert_to)
      value = case convert_to
      when 'weekly'
        case frequency
        when 'fortnightly'
          amount / 2
        when 'monthly'
          (amount * 12) / 52
        when 'yearly'
          amount / 52
        else
          amount
        end

      when 'fortnightly'
        case frequency
        when 'weekly'
          amount * 2
        when 'monthly'
          (amount * 12) / 26
        when 'yearly'
          amount / 26
        else
          amount
        end

      when 'monthly'
        case frequency
        when 'weekly'
          (amount * 52) / 12
        when 'fortnightly'
          (amount * 26) / 12
        when 'yearly'
          amount / 12
        else
          amount
        end

      when 'yearly'
        case frequency
        when 'weekly'
          amount * 52
        when 'fortnightly'
          amount * 26
        when 'monthly'
          amount * 12
        else
          amount
        end
      end

      value.round(2)
    end

  end
end