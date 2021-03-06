class Admin::ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_required
    layout "admin"
    
    def index
        @products = Product.all
    end
    
    def show
        @product = Product.find(params[:id])
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        
        if @product.save
            redirect_to admin_products_path,notice:"Added a new product!"
        else
            render :new
        end
    end
    
    def edit
        @product = Product.find(params[:id])
    end
    
    def update
        @product = Product.find(params[:id])
        
        if @product.update(product_params)
            redirect_to admin_products_path,notice:"Updated a product!"
        else
            render :edit
        end
    end
    
    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_path,alert:"Deleted a product!"
    end
    

    def admin_required
        if !current_user.admin?
            redirect_to "/", alert: "You are not admin."
        end
    end
    
    private
    
    def product_params
        params.require(:product).permit(:title, :description, :price, :quantity, :img)
    end
    
end
