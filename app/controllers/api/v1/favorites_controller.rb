class Api::V1::FavoritesController < ApplicationController
  def create
    user = find_user_by_api_key(params[:api_key])

    raise ActiveRecord::RecordNotFound.new("Sorry, your credentials are bad.") unless user

    params[:user_id] = user.id
    favorite = Favorite.new(favorite_params)

    if favorite.save!
      render json: { success: "Favorite added successfully" }, status: :created
    end
  end

private
  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title, :user_id)
  end
end
