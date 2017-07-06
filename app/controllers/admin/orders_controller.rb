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
end
