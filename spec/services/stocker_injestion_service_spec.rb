# frozen_string_literal: true

require 'rails_helper'
require 'fixtures/geocoder_results_factory'

RSpec.describe StockerIngestionService do
  let(:example) do
    {
      date_stocked: '2023 09 SEPTEMBER',
      species: 'SNAKE RIVER CUTTHROAT',
      quantity: '551',
      avg_length: '3.7',
      address: 'MYSTERY LAKE',
      county: 'FREMONT',
      state: 'wyoming'
    }
  end
  describe 'successfully ingests a new address, whether geocoder returns a result or not' do
    it 'happy path, stores coordinates when results are found' do
      allow(Geocoder).to receive(:search).and_return(GeocoderResultsFactory.single_hit_correct_state)
      result = described_class.call(example)
      expect(result).to be_verified
      expect(result.verification_problem).to be_nil
      expect(result.state).to eq('wyoming')
      expect(result.lonlat).to be_a RGeo::Cartesian::PointImpl
    end

    it 'stores record with proper status if no results' do
      allow(Geocoder).to receive(:search).and_return(GeocoderResultsFactory.empty_results)
      result = described_class.call(example)
      expect(result).to be_unverified
      expect(result).to be_not_found
      expect(result.state).to eq('wyoming')
      expect(result.lonlat).to be_nil
    end

    it 'stores record with proper status if states do not match' do
      allow(Geocoder).to receive(:search).and_return(GeocoderResultsFactory.non_matching_state)
      result = described_class.call(example)
      expect(result).to be_unverified
      expect(result).to be_state_mismatch
      expect(result.lonlat).to be_a RGeo::Cartesian::PointImpl
    end
  end
end

# #<Geocoder::Result::Nominatim:0x0000000110bf3680
# @cache_hit=nil,
# @data=
#  {"place_id"=>260963338,
#   "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://osm.org/copyright",
#   "osm_type"=>"way",
#   "osm_id"=>787127452,
#   "lat"=>"42.02095205",
#   "lon"=>"-105.60554535",
#   "class"=>"landuse",
#   "type"=>"reservoir",
#   "place_rank"=>22,
#   "importance"=>0.2000000999999999,
#   "addresstype"=>"reservoir",
#   "name"=>"Duck Creek Reservoir",
#   "display_name"=>"Duck Creek Reservoir, Albany County, Wyoming, United States",
#   "address"=>
#    {"landuse"=>"Duck Creek Reservoir",
#     "county"=>"Albany County",
#     "state"=>"Wyoming",
#     "ISO3166-2-lvl4"=>"US-WY",
#     "country"=>"United States",
#     "country_code"=>"us"},
#   "boundingbox"=>["42.0194616", "42.0223070", "-105.6078011", "-105.6043196"]}>
