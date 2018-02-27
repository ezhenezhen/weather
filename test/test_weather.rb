require 'minitest/autorun'
require 'weather'
require 'vcr'

# VCR.configure do |config|
#   config.cassette_library_dir = "fixtures/vcr_cassettes"
#   config.hook_into :webmock
# end

class TestWeather < Minitest::Test
  def test_weather_nyc
    assert_match "New York JFK", Weather.get("NYC")
  end

  def test_missing_city
    assert_match "No data available", Weather.get("London")
  end
end
