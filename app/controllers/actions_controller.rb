class ActionsController < ApplicationController
    def list
        @actions = Action.all!
     end
    
    def show
        @actions = Action.find(params[:id])
    end
    
    def new
        @actions = Action.new
    end
    
    def create
        @actions = Action.new(action_params)
         
        if @actions.save!
           redirect_to :action => 'list'
        else
           @actions = Action.all
           render :action => 'new'
        end
        
     end
     
     def action_params
        params.require(:@actions).permit(:action,:access_level_id)
     end
    
    def edit
        @actions = Action.find(params[:id])
    end
    
    def update
        @actions = Action.find(params[:id])
         
        if @actions.update_attributes(Action_params)
           redirect_to :action => 'show', :id => @actions
        else
           @actions = Action.all
           render :action => 'edit'
        end
        
     end
    
    def delete
        redirect_to :action => 'list'
    end
end
