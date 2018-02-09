module HomeLoanResource
  class Loan

    # period - number of periods (months)
    # interest_only_period - interest only period (years)
    # type - when the payments are due:
    #  0: end of the period, e.g. end of month (default)
    #  1: beginning of period
    def self.calculate_monthly_repayment(repayment_type, interest_rate, loan_amount, period=360, iop=0, future_value=0, type=0)
      interest_rate = (interest_rate / 100) / 12

      if repayment_type == "interest_only"
        interest_only_period = iop
        period = period - (interest_only_period * 12)
      else
        period = period
      end


      return -(loan_amount + future_value)/period if interest_rate == 0

      pvif = ((1 + interest_rate) ** period)
      pmt = - interest_rate * loan_amount * ( pvif + future_value ) / ( pvif - 1 )

      pmt = pmt / (1 + interest_rate) if type == 1

      return pmt.round(2).abs
    end

  end
end