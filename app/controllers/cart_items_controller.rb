class CartItemsController < ApplicationController
    before_action :set_cart, only: [:create, :destroy]
    before_action :set_cart_item, only: [:destroy]
  
    def create
      product = Product.find(params[:product_id])
      @cart_item = @cart.add_product(product)
  
      if @cart_item.save
        puts "Product added to cart: #{product.name}"

        redirect_to cart_path, notice: 'Product was successfully added to cart.'
      else
        puts "Failed to add product: #{product.name}"

        redirect_to products_path, alert: 'Unable to add product to cart.'
      end
    end
  
    def destroy
      @cart_item.destroy
      redirect_to @cart, notice: 'Product was successfully removed from cart.'
    end
  
    private
  
    def set_cart
      @cart = current_cart
    end
  
    def set_cart_item
      @cart_item = @cart.cart_items.find(params[:id])
    end
end
  