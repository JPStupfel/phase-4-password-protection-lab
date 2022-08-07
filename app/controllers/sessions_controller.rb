class SessionsController < ApplicationController

    def destroy
        session.delete :user_id
        render json: {}, status: 204
    end

    def create
        user = User.find_by username: params["username"]
        
        if user &.authenticate(params['password'])
            
            session[:user_id] = user.id
            render json: user, status: 201
        else
            render json: {error: 'invalid'}, status: 401
        end
        
    end

end
