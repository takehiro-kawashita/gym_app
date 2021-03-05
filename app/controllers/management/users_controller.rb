class Management::UsersController < ApplicationController
    
    def new
        @users = User.all
    end
    
    def create
    end
end