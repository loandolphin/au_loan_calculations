RSpec.describe HomeLoan::Parse do

  describe '.convert_amount' do
    let(:value) { HomeLoan::Parse.convert_amount(amount, frequency, convert_to) }

    context 'when convert an amount to weekly' do
      let(:convert_to) { 'weekly' }

      context 'when $100 per week' do
        let(:amount) { 100 }
        let(:frequency) { 'weekly' }

        it 'returns $100 per week' do
          expect(value).to eql(100.0)
        end
      end

      context 'when $200 per fortnight' do
        let(:amount) { 200 }
        let(:frequency) { 'fortnightly' }

        it 'returns $100 per week' do
          expect(value).to eql(100.0)
        end
      end

      context 'when $2,000 per month' do
        let(:amount) { 2000 }
        let(:frequency) { 'monthly' }

        it 'returns $461.0 per week' do
          expect(value).to eql(461.0)
        end
      end

      context 'when $24,000 per year' do
        let(:amount) { 24000 }
        let(:frequency) { 'yearly' }

        it 'returns $461.0 per week' do
          expect(value).to eql(461.0)
        end
      end
    end

    context 'when convert an amount to fortnightly' do
      let(:convert_to) { 'fortnightly' }

      context 'when $200 per fortnight' do
        let(:amount) { 200 }
        let(:frequency) { 'fortnightly' }

        it 'returns $200 per fortnight' do
          expect(value).to eql(200.0)
        end
      end

      context 'when $100 per week' do
        let(:amount) { 100 }
        let(:frequency) { 'weekly' }

        it 'returns $200 per fortnight' do
          expect(value).to eql(200.0)
        end
      end

      context 'when $2,000 per month' do
        let(:amount) { 2000 }
        let(:frequency) { 'monthly' }

        it 'returns $923.0 per fortnight' do
          expect(value).to eql(923.0)
        end
      end

      context 'when $24,000 per year' do
        let(:amount) { 24000 }
        let(:frequency) { 'yearly' }

        it 'returns $923.0 per fortnight' do
          expect(value).to eql(923.0)
        end
      end
    end

    context 'when convert an amount to monthly' do
      let(:convert_to) { 'monthly' }

      context 'when $1000 per month' do
        let(:amount) { 1000 }
        let(:frequency) { 'monthly' }

        it 'returns $1,000.0 per month' do
          expect(value).to eql(1000.0)
        end
      end

      context 'when $100 per week' do
        let(:amount) { 100 }
        let(:frequency) { 'weekly' }

        it 'returns $433.0 per month' do
          expect(value).to eql(433.0)
        end
      end

      context 'when $200 per fortnight' do
        let(:amount) { 200 }
        let(:frequency) { 'fortnightly' }

        it 'returns $433.0 per month' do
          expect(value).to eql(433.0)
        end
      end

      context 'when $24,000 per year' do
        let(:amount) { 24000 }
        let(:frequency) { 'yearly' }

        it 'returns $2,000 per month' do
          expect(value).to eql(2000.0)
        end
      end
    end

    context 'when convert an amount to yearly' do
      let(:convert_to) { 'yearly' }

      context 'when $12,200 per year' do
        let(:amount) { 12200 }
        let(:frequency) { 'yearly' }

        it 'returns $12,200 per year' do
          expect(value).to eql(12200.0)
        end
      end

      context 'when $100 per week' do
        let(:amount) { 100 }
        let(:frequency) { 'weekly' }

        it 'returns $5,200 per year' do
          expect(value).to eql(5200.0)
        end
      end

      context 'when $200 per fortnight' do
        let(:amount) { 200 }
        let(:frequency) { 'fortnightly' }

        it 'returns $5,200 per year' do
          expect(value).to eql(5200.0)
        end
      end

      context 'when $1,000 per month' do
        let(:amount) { 1000 }
        let(:frequency) { 'monthly' }

        it 'returns $12,000 per year' do
          expect(value).to eql(12000.0)
        end
      end
    end
  end
end
