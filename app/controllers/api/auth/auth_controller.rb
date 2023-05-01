class Api::Auth::AuthController < ApplicationController
  def login
    require 'bcrypt'
    user = User.find_by(:username => params[:username], :password_digest => params[:password])

    #check if user exists
    if !user
      render json: { msg: "Username Doesnt exists" }, status: :unprocessable_entity
      return true;
    end

    # logger.debug "User ssssssssssssssssssssssssss #{user.authenticate(params[:password])}"
    if  user.authenticate(params[:password])
      render json: { msg: "Successfully logged in",user: user }, status: :ok
    else
      render json: { msg: "password wrong"}, status: :unprocessable_entity
    end

  end
end
