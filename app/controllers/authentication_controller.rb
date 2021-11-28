class AuthenticationController < ApplicationController
    def user_params
        params.require(:user).permit(:email, :password)
    end
    def signin
      user = User.find_by(email: user_params[:email])

      # finds existing user, checks to see if user can be authenticated
      if user.present? && user.password==user_params[:password]
      # sets up user.id sessions
        session[:user_id] = user.id
        session[:user] = user
        redirect_to :action => 'dashboard', notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :action => 'sign'
      end
    end
    def signout
      # deletes user session
      session[:user_id] = nil
      session[:user] = nil
      redirect_to :action => 'sign', notice: 'Logged Out'
    end

    def sign 
      render :action => 'sign'
    end
    def dashboard 
      @users = User.all
      @sales = Sale.all
      @totalRevenues=0;
      @quantitySold=0;
      @sales.each do |c| 
        @totalRevenues=@totalRevenues+ c.price*c.quantity;
        @quantitySold = @quantitySold + c.quantity;
      end
      @products = Product.all
      @totalProducts=0;
      @products.each do |c| 
        @totalProducts=@totalProducts+ c.quantity;
      end
      @stockLevel=@totalProducts-@quantitySold 
      render :action => 'dashboard'
    end
end
