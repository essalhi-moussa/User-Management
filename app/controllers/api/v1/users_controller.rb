class Api::V1::UsersController < ApplicationController
    before_action :getUser, only: [:deleteUser, :updateUser, :show]
    before_action  only: [:updateUser, :deleteUser] do
        check_token
    end

    #get
    def getUsers
        user = User.all
        if user
            render json: user, status: :ok
        else
            render json: {msg: "user empty"}, status: :unprocessable_entity
        end
    end

    #post
    def addUser
        user = User.new(:username=> params[:username], :password_digest=> (params[:password]) , :email=> params[:email])
        user.type = 2 #evrytime a user is created a type is will be default 2
        if user.save
            render json: user, status: :ok
        else
            # render json: {message: "User not added", status: :unprocessable_entity}
            render json: {message: "User not added", error: user.errors}, status: :unprocessable_entity
            
        end
        
    end

    #show
    def show
        if  @user   
            render json: @user, status: :ok
           
        else
            render json: {message: "User not Found"}, status: :unprocessable_entity
        end
    end

    #put
    def updateUser
        if  @user
            if  @user.update(userparams)
                render json: @user, status: :ok
            else
                render json: {message: "Update Failed"}, status: :unprocessable_entity
            end
        else
            render json: {message: "User not Found", error: @user.errors}, status: :unprocessable_entity
        end
    end

    #delete
    def deleteUser
        if  @user
            if  @user.destroy(userparams)
                render json: {message: "User deleted"}, status: :ok
            else
                render json: {message: "delete Failed"}, status: :unprocessable_entity
            end
        else
            render json: {message: "User not Found"}, status: :unprocessable_entity
        end
    end

    def remove
        User.all.destroy
    end
    private
        def userparams
            params.permit(:username, :password, :email);
            
        end

        def getUser
            @user = User.find(params[:id])
            
        end
end
