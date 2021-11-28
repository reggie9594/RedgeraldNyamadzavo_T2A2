class ProductController < ApplicationController
    def list
        # SETTUNG CUSTOMER ARRIVAL TIME (UNIX TIMESTAMP)
        if !session[:customerArrivalTimestamp] || session[:customerArrivalTimestamp]!=nil
        session[:customerArrivalTimestamp] =Time.now.to_time.to_i
        end
        puts "*****************"
        puts session[:customerArrivalTimestamp] 
        @products = Product.all.isNotDeleted
     end
    
    def show
        @product = Product.find(params[:id])
    end
    
    def new
        @products = Product.new
    end
    
    def create
        @products = Product.new(product_params)
         
        if @products.save!
            session[:product_id] =@products.id;
           redirect_to :action => 'new', :controller => 'product_image'
        else
           @products = Product.all
           render :action => 'new'
        end
        
     end
     def image
        params.require(:productImage).permit(:image)
     end
     def product_params
        params.require(:product).permit(:name, :price, :user_id, :quantity, :description)
     end
    
    def edit
        @products = Product.find(params[:id])
    end
    
    def update
        @products = Product.find(params[:id])
         
        if @products.update(product_params)
           redirect_to :action => 'list', :id => params[:id]
        else
           @products = Product.all
           render :action => 'edit'
        end
        
     end
    
    def delete
        @products = Product.find(params[:id])

        if @products.update(:isDeleted=> true)
            redirect_to :action => 'list'
        end
        
        
    end
end
