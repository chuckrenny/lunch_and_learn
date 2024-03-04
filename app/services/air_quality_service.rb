class AirQualityService
  def conn
    Faraday.new(url: "http://api.openweathermap.org")
  end

  def get_url(url)
    response = conn.get(url) do |req|
      req.params[:appid] = Rails.application.credentials.open_weather_api[:key]
    end

    JSON.parse(response.body, symbolize_names: true)
  end
  
  def air_quality_data(lat, lon)
    get_url("/data/2.5/air_pollution?lat=#{lat}&lon=#{lon}")
  end
end