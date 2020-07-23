class UsersController < ApplicationController
    def index
        render json: User.all, include: [:templates, :contacts]
    end 

    def login 

    end 

    def create
        user = User.create(email: params[:email], password_digest: params[:password])
        if user.valid?
            render json: user, include: [:templates, :contacts]
        else
            render json: { error: `#{user.errors.full_messages}`}, status: 401
        end

    end 
end
