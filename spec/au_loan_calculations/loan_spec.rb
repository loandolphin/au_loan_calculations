RSpec.describe AuLoanCalculations::Loan do

  describe '.calculate_monthly_repayment' do
    let(:loan_amount) { 400000 }
    let(:interest_rate) { 7.75 }
    let(:loan_term) { 360 }

    context 'when repayment type is Principal & Interest' do
      let(:repayment_type) { "principal_and_interest" }

      it 'results in $2,865.65' do
        result = AuLoanCalculations::Loan.calculate_monthly_repayment(
          repayment_type,
          interest_rate,
          loan_amount
        )

        expect(result).to eql(2865.65)
      end
    end


    context 'when repayment type is Interest only' do
      let(:repayment_type) { "interest_only" }
      let(:interest_only_period) { 2 }

      it 'results in $2,918.95' do
        result = AuLoanCalculations::Loan.calculate_monthly_repayment(
          repayment_type,
          interest_rate,
          loan_amount,
          loan_term,
          interest_only_period
        )

        expect(result).to eql(2918.95)
      end
    end
  end

end
