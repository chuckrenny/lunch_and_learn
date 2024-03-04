class CountryFacade
  def self.random_country
    service = CountryService.new
    json = service.all_countries

    random_country = json.sample
    CountryPoro.new(random_country).name
  end

  def self.lat_lon(country)
    service = CountryService.new
    json = service.specific_country(country).first

    CountryPoro.new(json)
  end
end