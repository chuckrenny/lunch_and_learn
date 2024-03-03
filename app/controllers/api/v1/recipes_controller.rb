class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:country]

    render json: RecipeSerializer.new(RecipeFacade.recipe_search(country))
  end
end