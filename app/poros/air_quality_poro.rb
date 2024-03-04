class AirQualityPoro
  attr_reader :aqi, :datetime, :readable_aqi, :id

  def initialize(data)
    @aqi = data[:list].first[:main][:aqi]
    @datetime = data[:list].first[:dt]
    @readable_aqi = format_aqi(@aqi)
  end

private
  def format_aqi(aqi)
    case aqi
    when 1
      "Good"
    when 2
      "Fair"
    when 3
      "Moderate"
    when 4
      "Poor"
    when 5
      "Very Poor"
    end
  end
end