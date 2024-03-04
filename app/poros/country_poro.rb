class CountryPoro
  attr_reader :name, :latlng

  def initialize(data)
    # require 'pry';binding.pry
    @name = data[:name][:common]
    @latlng = data[:latlng]
  end
end