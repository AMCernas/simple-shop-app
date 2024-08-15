class ProductsController < ApplicationController

    def index
      @products = Product.all
    end
  
    def show
      @product = Product.find(params[:id])
    end
  
    def new
    end
  
    def edit
      @product = Product.find(params[:id])
    end
  
    def update
      @product = Product.find(params[:id])
      @product.update(product_params)
    end
  
    def destroy 
      @product = Product.find(params[:id])
      @product.destroy
    end
  
    def create
      @product = Post.new(product_params)
      @product.save
    end
    private
    def product_params
        params.require(:product).permit(:name, :price, :description, :image)
    end
end
