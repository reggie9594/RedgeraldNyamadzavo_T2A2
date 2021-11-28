class AccessLevelActionController < ApplicationController
    def list
        @access_level_actions= AccessLevelAction.all
     end
    
    def show
        @access_level_actions = AccessLevelAction.find(params[:id])
    end
    
    def new
        @access_level_actions = AccessLevelAction.new
    end
    
    def create
        @access_level_actions = AccessLevelAction.new(action_params)
         
        if @access_level_actions.save!
           redirect_to :action => 'list'
        else
            @access_level_actions = AccessLevelAction.all
           render :action => 'new'
        end
        
     end
     
     def action_params
        params.require(:access_level_actions).permit(:action,:access_level_id)
     end
    
    def edit
        @access_level_actions = AccessLevelAction.find(params[:id])
    end
    
    def update
        @access_level_actions = AccessLevelAction.find(params[:id])
         
        if @access_level_actions.update_attributes(Action_params)
           redirect_to :action => 'show', :id => actions
        else
            @access_level_actions = AccessLevelAction.all
           render :action => 'edit'
        end
        
     end
    
    def delete
        redirect_to :action => 'list'
    end
end
