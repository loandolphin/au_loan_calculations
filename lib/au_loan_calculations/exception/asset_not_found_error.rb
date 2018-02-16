module AuLoanCalculations
  module Exception
    class AssetNotFoundError < StandardError
      def initialize(msg = 'Asset not found')
        super
      end
    end
  end
end