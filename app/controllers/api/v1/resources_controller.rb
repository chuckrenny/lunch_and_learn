class Api::V1::ResourcesController < ApplicationController
  ResourceData = Struct.new(:country, :video, :images, :id)

  def index
    country = params[:country]

    # country parameter passed in  || invalid country param/empty string
    if !country.nil? && !country.empty?
      video = ResourceFacade.resources_search(country)
      images = ImageFacade.country_image_search(country)

      resource_data = ResourceData.new(country, video, images, nil)

      render json: ResourceSerializer.new(resource_data)
      # if !recipes.empty?
      #   render json: RecipeSerializer.new(RecipeFacade.recipe_search(country))
      # elsif recipes.empty?
      #   render json: { "data": [] }, status: :ok
      # end
    # else
    #   random_country = CountryFacade.random_country
    #   render json: RecipeSerializer.new(RecipeFacade.recipe_search(random_country))
    end
  end
end

