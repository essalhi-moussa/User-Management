class Api::Auth::AuthController < ApplicationController
  def login
    require 'bcrypt'
    user = User.find_by(:username => params[:username])

    #check if user exists
    unless user
      render json: { msg: "Username Doesnt exists" }, status: :unprocessable_entity
      return true
    end

    if  user.password_digest ==  params[:password]
      token = self.create_token(user.id.to_s, user.username, user.type.to_s)

      user.set(:token => token)
      render json: { msg: "Successfully logged in",user: user }, status: :ok
    else
      render json: { msg: "password wrong"}, status: :unprocessable_entity
    end

  end
end
