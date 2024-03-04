class Api::V1::AirQualityController < ApplicationController
  def index
    country = params[:country]

    if !country.nil? && !country.empty?
      country = CountryFacade.lat_lon(country)

      air_quality = AirQualityFacade.air_quality_results(country.latlng)

      render json: AirQualitySerializer.new(air_quality)
    end
  end
end