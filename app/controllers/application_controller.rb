class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to :back,notice: "add to cart"
  end
end
