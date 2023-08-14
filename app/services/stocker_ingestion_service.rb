# frozen_string_literal: true

class StockerIngestionService
  class StockerIngestionError < StandardError; end
  attr_accessor :date_stocked,
                :species,
                :quantity,
                :avg_length,
                :address,
                :county,
                :state

  def initialize(ingestion_params)
    @date_stocked = ingestion_params[:date_stocked]
    @species = ingestion_params[:species]
    @quantity = ingestion_params[:quantity]
    @avg_length = ingestion_params[:avg_length]
    @address = ingestion_params[:address]
    @county = ingestion_params[:county]
    @state = ingestion_params[:state]
  end

  def self.call(ingestion_params)
    new(ingestion_params).call
  end

  def call
    results = Geocoder.search(address_to_interpret)
    persist_stocker(results[0])
  end

  def address_to_interpret
    @address_to_interpret ||= "#{address}, #{county} county, #{state}, USA"
  end

  def persist_stocker(result)
    Stocker.create(
      date_stocked: Date.parse(date_stocked),
      species:,
      quantity:,
      avg_length:,
      water_name: address,
      county:,
      state:,
      lonlat: point(result),
      interpreted_address: address_to_interpret,
      **verification_atts(result)
    )
  rescue StandardError => e
    raise StockerIngestionError, "An Error was raised during processing #{e.message}"
  end

  def verification_atts(result)
    if !result
      puts 'No Result!!!!'
      {
        verification_problem: Stocker.verification_problems[:not_found],
        **unverified_atts
      }
    elsif result.state.downcase != state.downcase
      {
        verification_problem: Stocker.verification_problems[:state_mismatch],
        **unverified_atts
      }
    else
      verified_atts
    end
  end

  def unverified_atts
    {
      verification_status: Stocker.verification_statuses[:unverified]
    }
  end

  def verified_atts
    {
      verification_status: Stocker.verification_statuses[:verified]
    }
  end

  def point(result)
    return unless result
    "POINT(#{result.data['lat']} #{result.data['lon']})"
  end
end
