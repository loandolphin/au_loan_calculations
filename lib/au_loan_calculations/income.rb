require 'date'
require 'csv'

module AuLoanCalculations
  class Income

    def self.calculate_payg_net_value(value, year=Date.today.year)
      begin
        # income_tax_rates_file = CSV.read("vendor/assets/csvs/payg_tax_rates/#{year.to_s}.csv", { headers: true })
        gem_path ||= File.expand_path '..', File.dirname(__FILE__)
        assets_path ||= File.join gem_path, "../assets"
        file = File.join assets_path, "csvs/payg_tax_rates/#{year.to_s}.csv"

        income_tax_rates_file = CSV.read(file, { headers: true })

        income_tax_rates_file.each do |income_tax_rate|

          # check the income tax rate
          if value >= income_tax_rate["min_value"].to_i && value <= income_tax_rate["max_value"].to_i

            # calculate the taxable value
            tax_over_threshold = value - income_tax_rate["threshold"].to_i

            # sum the taxable value plus range tax value
            tax_value = tax_over_threshold * income_tax_rate["tax_per_dollar_over_threshold"].to_f

            # calculate medicare levy value
            medicare_levy_value = (value * income_tax_rate["medicare_levy_percentage"].to_f) / 100

            # calculate total tax (including medicare levy value)
            total_tax = income_tax_rate["tax_over_threshold"].to_i + tax_value + medicare_levy_value

            # income value - total tax
            return (value - total_tax)
          end
        end

      rescue Errno::ENOENT
        raise AuLoanCalculations::Exception::AssetNotFoundError, "Unable to find the income tax rates for #{year}."
      end
    end

  end
end