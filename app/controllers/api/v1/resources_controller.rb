class Api::V1::ResourcesController < ApplicationController
  def index
    country = params[:country]

    # country parameter passed in     ##|| invalid country param/empty string
    if !country.nil? && !country.empty?
      resources = ResourceFacade.resources_search(country)

      ################## **currently here**
      render json: ResourceSerializer.new(resources,)
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

