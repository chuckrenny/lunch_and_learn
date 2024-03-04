class RecipePoro 
  attr_reader :title, :url, :country, :image, :id

  def initialize(data, country)
    @title = data[:recipe][:label]
    @url = data[:recipe][:uri]
    @country = country
    @image = data[:recipe][:image]
  end
end