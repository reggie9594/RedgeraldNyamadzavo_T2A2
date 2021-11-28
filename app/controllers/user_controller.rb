class UserController < ApplicationController

    def list
        @users = User.all
     end
    
    def show
        @access_levels = AccessLevel.all
        @user = User.find(params[:id])
    end
    
    def new
        @access_levels = AccessLevel.all
        @users = User.new
    end
    
    def create
        @users = User.new(user_params)
         
        if @users.save!
           redirect_to :action => 'list'
        else
            @validation="Email not valid"
           @users = User.all
           render :action => 'new'
        end
        
     end
     
     def user_params
        params.require(:user).permit(:email, :address, :password, :name,:access_level_id)
     end
    
    def edit
        @users = User.find(params[:id])
    end
    
    def update
        @users = User.find(params[:id])
         
        if @users.update(user_params)
           redirect_to :action => 'show', :id => params[:id]
        else
            @access_levels = AccessLevel.all
            @user = User.find(params[:id])
           render :action => 'show'
        end
        
     end
    
    def delete
        redirect_to :action => 'list'
    end
end
