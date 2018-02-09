RSpec.describe HomeLoan::Income do

  describe '.calculate_payg_net_value' do

    context 'when CSV file does not exist' do
      it 'raises an exception' do
        expect { HomeLoan::Income.calculate_payg_net_value(80000, 2010) }
          .to raise_error(HomeLoan::Exception::AssetNotFoundError)
          .with_message("Unable to find the income tax rates for 2010.")
      end
    end

    context 'when CSV file exists' do
      context 'when do not pass the year' do
        context 'when $80,000/yearly' do
          it 'returns $60,853/yearly' do
            value = HomeLoan::Income.calculate_payg_net_value(80000)
            expect(value).to eql(60853.0)
          end
        end
      end

      context 'when passes the year' do
        context 'when $5,000/monthly' do
          it 'returns $47,753/yearly' do
            value = HomeLoan::Income.calculate_payg_net_value(60000, 2018)
            expect(value).to eql(47753.0)
          end
        end
      end
    end

  end

end