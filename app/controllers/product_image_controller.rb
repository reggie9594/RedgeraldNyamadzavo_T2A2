class ProductImageController < ApplicationController
  def index   
    @product_images = ProductImage.all   
 end   
    
 def new   
    @product_image = ProductImage.new   
 end   
    
 def create   
    @product_image = ProductImage.new(resume_params)
    @product_image.id=session[:product_id] 
    @products = Product.find(session[:product_id])
    @products.update(:imageurl=> "/uploads/product_image/attachment/#{session[:product_id]}/"+params[:product_image][:attachment].original_filename.gsub(" ", "_").gsub("#", "_"))
    if @product_image.save   
       redirect_to :action=>'list', :controller=>"product", notice: "Successfully uploaded."   
    else   
       render "new"   
    end   
       
 end   
    
 def destroy   
    @product_image = ProductImage.find(params[:id])   
    @product_image.destroy   
    redirect_to :action=>'index', notice:  "Successfully deleted."   
 end   

 private   
def resume_params   
    params.require(:product_image).permit(:name, :attachment)   
 end   
    
end
