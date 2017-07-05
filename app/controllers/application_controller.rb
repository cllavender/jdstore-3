class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def add_to_cart
    @product = Product.find(params[:id])
    
    current_cart.add_product_to_cart(@product)
    redirect_to :back
  end
end
