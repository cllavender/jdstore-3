class CartsController < ApplicationController
    
    def clean
        current_cart.clean!
        flash[:warning] = "成功将购物车清空"
        redirect_to carts_path
    end
    
    def checkout
        @order = Order.new
    end
    
end
