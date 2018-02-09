module HomeLoanResource
  module Exception
    class AssetNotFoundError < StandardError
      def initialize(msg = 'Asset not found')
        super
      end
    end
  end
end