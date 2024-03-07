class Api::V1::UsersController < ApplicationController
  def create

    user = User.new(user_params)
    user.save!  # This will raise ActiveRecord::RecordInvalid if the item is invalid
    render json: UserSerializer.new(user), status: :created
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end