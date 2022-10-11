class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(username:params[:user][:username])
        if @user.save
            redirect_to @user
        else
            render :new
        end
    end