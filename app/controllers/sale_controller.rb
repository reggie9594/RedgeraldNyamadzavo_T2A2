require 'paypal-checkout-sdk'
require 'json'

class SaleController < ApplicationController
    def cart
        list = session[:cart]?session[:cart]:[];
        list.push(cart_params);
        session[:cart]=list;
        puts list
        redirect_to :action => 'list', :controller => 'product' 
    end
    def cart_params
        params.require(:cart).permit(:product_id, :name, :quantity, :price,:date)
    end
    def sale 
        # duration = Time.at(duration).utc.strftime("%M:%S")
        if session[:customerArrivalTimestamp]!=nil
        puts "***********************"
        puts Time.at(Time.now.to_time.to_i - session[:customerArrivalTimestamp]).utc.strftime("%M");
        puts "***********************"
        end
        session[:customerArrivalTimestamp]=nil
        session[:cart].each do |c|
            if c["quantity"].to_i>0
                @sales = Sale.new(:product_id=>c["product_id"],:quantity=>c["quantity"], :price=>c["price"],:date=>c["date"])
                @sales.save
            end
        end
        session[:cart]=[]
        redirect_to :action =>'pay'
    end
    def pay  
        # Creating Access Token for Sandbox
        client_id = "AZL6_pl6l1t4VWf1AjnvxDIuTKjX-dr1JSbz16VJW1x6rJtXJGGTqPUa_GrJYI_l6y6Xw5tcZTYh8sOI"
        client_secret = "EEH_yEhqwKzgBPZTXDqX-K5YEiNw9XSJU-FphlC8fWzPjdl-KWqdY_pocD2thL7ONOlsv_FUaGQM9gQ5"
        # Creating an environment
        environment = PayPal::SandboxEnvironment.new(client_id, client_secret)
        client = PayPal::PayPalHttpClient.new(environment)
        request = PayPalCheckoutSdk::Orders::OrdersCreateRequest::new
        request.request_body({
                                intent: "CAPTURE",
                                purchase_units: [
                                    {
                                        amount: {
                                            currency_code: "USD",
                                            value: "100.00"
                                        }
                                    }
                                ]
                            })

        begin
            # Call API with your client and get a response for your call
            response = client.execute(request)

            # If call returns body in response, you can get the deserialized version from the result attribute of the response
            order = response.result
            puts "***********Accepted**************"
            puts order["links"][1]
            puts "*************************"
            redirect_to order["links"][1]["href"]
            # render :action =>'pay'

        rescue PayPalHttp::HttpError => ioe
            # Something went wrong server-side
            puts "************Error*************"
            puts ioe.status_code
            puts ioe.headers["debug_id"]
            puts "*************************"
            render :action =>'list', :controller=>'product'
        end
    end
end
