class AccessLevelController < ApplicationController
    def list
        @access_levels = AccessLevel.all
     end
    
    def show
        @access_levels = AccessLevel.find(params[:id])
    end
    
    def new
        @access_levels = AccessLevel.new
    end
    
    def create
        @access_levels = AccessLevel.new(access_level_params)
         
        if @access_levels.save!
           redirect_to :action => 'list'
        else
           @access_levels = AccessLevel.all
           render :action => 'new'
        end
        
     end
     
     def access_level_params
        params.require(:access_level).permit(:name)
     end
    
    def edit
        @access_levels = AccessLevel.find(params[:id])
    end
    
    def update
        @access_levels = AccessLevel.find(params[:id])
         
        if @access_levels.update_attributes(access_level_params)
           redirect_to :action => 'show', :id => @AccessLevel
        else
           @access_levels = AccessLevel.all
           render :action => 'edit'
        end
        
     end
    
    def delete
        redirect_to :action => 'list'
    end
end
