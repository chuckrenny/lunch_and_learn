class AirQualityFacade
  def self.air_quality_results(latlng)
    service = AirQualityService.new
    json = service.air_quality_data(latlng[0], latlng[1])

    AirQualityPoro.new(json)
  end
end