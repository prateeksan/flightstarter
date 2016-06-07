begin
  countries = {
    "US" => { name: 'United States', addr: 'USA' },
    "CA" => { name: 'Canada', addr: 'Canada' },
  }
  regions = {
    'VT': 'Vermont',
    'NY': 'New York',
    'ON': 'Ontario',
  }
  [
    ['Burlington', 'VT', 'US', [44.4758825, -73.21207199999999]],
    ['Johnson', 'VT', 'US', [44.6356063, -72.6803979]],
    ['Toronto', 'ON', 'CA', [43.653226, -79.3831843]],
    ['San Francisco', 'CA', 'US', [37.7749295, -122.4194155]],
    ['New York', 'NY', 'US', [40.7143528, -74.0059731]],
  ].each do |city, region, country, coords|
    results = {
      'latitude'     => coords[0],
      'longitude'    => coords[1],
      'address'      => "#{city}, #{region}, #{countries[country][:addr]}",
      'state'        => regions[region],
      'state_code'   => region,
      'country'      => countries[country][:name],
      'country_code' => country
    }
    Geocoder::Lookup::Test.add_stub("#{city}, #{region}", [results])
    Geocoder::Lookup::Test.add_stub("#{city}, #{region}, #{countries[country][:addr]}", [results])
  end
end

Geocoder::Lookup::Test.set_default_stub(
  [
    {
      'latitude'     => 40.7143528,
      'longitude'    => -74.0059731,
      'address'      => 'New York, NY, USA',
      'state'        => 'New York',
      'state_code'   => 'NY',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)

