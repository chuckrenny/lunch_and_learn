class Api::V1::SessionsController < ApplicationController
  def create
    user = find_user_by_email(email: params[:email])

    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      raise ActiveRecord::RecordNotFound, "Sorry, your credentials are bad."
    end
  end
end