# frozen_string_literal: true

# # frozen_string_literal: true

require 'geocoder/results/nominatim'

class GeocoderResultsFactory
  def self.single_hit_correct_state
    [
      Geocoder::Result::Nominatim.new(
        { 'place_id' => 260_963_338,
          'licence' => 'Data © OpenStreetMap contributors, ODbL 1.0. http://osm.org/copyright',
          'osm_type' => 'way',
          'osm_id' => 787_127_452,
          'lat' => '42.02095205',
          'lon' => '-105.60554535',
          'class' => 'landuse',
          'type' => 'reservoir',
          'place_rank' => 22,
          'importance' => 0.2000000999999999,
          'addresstype' => 'reservoir',
          'name' => 'Duck Creek Reservoir',
          'display_name' => 'Duck Creek Reservoir, Albany County, Wyoming, United States',
          'address' =>
          { 'landuse' => 'Duck Creek Reservoir',
            'county' => 'Albany County',
            'state' => 'Wyoming',
            'ISO3166-2-lvl4' => 'US-WY',
            'country' => 'United States',
            'country_code' => 'us' },
          'boundingbox' => ['42.0194616', '42.0223070', '-105.6078011', '-105.6043196'] }
      )
    ]
  end

  def self.empty_results
    []
  end

  def self.non_matching_state
    [
      Geocoder::Result::Nominatim.new(
        { 'place_id' => 260_963_338,
          'licence' => 'Data © OpenStreetMap contributors, ODbL 1.0. http://osm.org/copyright',
          'osm_type' => 'way',
          'osm_id' => 787_127_452,
          'lat' => '42.02095205',
          'lon' => '-105.60554535',
          'class' => 'landuse',
          'type' => 'reservoir',
          'place_rank' => 22,
          'importance' => 0.2000000999999999,
          'addresstype' => 'reservoir',
          'name' => 'Duck Creek Reservoir',
          'display_name' => 'Duck Creek Reservoir, Albany County, Albania, United States',
          'address' =>
          { 'landuse' => 'Duck Creek Reservoir',
            'county' => 'Albany County',
            'state' => 'Albania',
            'ISO3166-2-lvl4' => 'US-WY',
            'country' => 'United States',
            'country_code' => 'us' },
          'boundingbox' => ['42.0194616', '42.0223070', '-105.6078011', '-105.6043196'] }
      )
    ]
  end

  def self.double_hit_correct_state
    single_hit_correct_state.concat(single_hit_correct_state)
  end
end
