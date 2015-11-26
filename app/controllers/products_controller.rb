class ProductsController < ApplicationController
  def index
    @products = Product.order("id DESC")
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if !current_cart.items.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "You have successfully put #{@product.title} into the cart!"
    else
      flash[:warning] = "This item is already in your cart!"
    end

    redirect_to :back
  end
end
