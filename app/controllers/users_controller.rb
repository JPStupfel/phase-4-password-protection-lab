class UsersController < ApplicationController


  def create
    user = User.create user_params
    if user.valid?
      session[:user_id] = user.id
      render json: user, status: 201
    else
      render json: {error: 'invalid'}, status: 422
    end
  end

  def show
    user = User.find_by id: session[:user_id]
    if user
        render json: user
    else
        render json: {error: 'user not found'}, status: 401
    end
  end

  private 

  def user_params
    params.permit :username, :password, :password_confirmation
  end
end
