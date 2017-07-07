class Admin::OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_required
    layout "admin"
    
    def admin_required
        if !current_user.admin?
            redirect_to "/", alert: "You are not admin."
        end
    end
    
    def index
        @orders = Order.order("id DESC")
    end
    
    def show
        @order = Order.find(params[:id])
        @product_lists = @order.product_lists
    end 

    def cancel
        @order = Order.find(params[:id])
        
        @order.cancel_order!
        redirect_to :back
    end
    
    def ship
        @order = Order.find(params[:id])
        
        @order.ship!
        redirect_to :back
    end
    
    def shipped
        @order = Order.find(params[:id])
        
        @order.deliver!
        redirect_to :back
    end
    
    def return
        @order = Order.find(params[:id])
        
        @order.return_good!
        redirect_to :back
    end
end
