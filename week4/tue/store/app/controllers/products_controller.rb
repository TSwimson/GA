class ProductsController < ApplicationController

	def index 
		@products = Product.all
	end

  def show
  	@product = Product.find(params[:id])
  end

  def edit
    
  	@product = Product.find(params[:id])
    @product_categories = @product.categories
    @categories = Category.all - @product_categories
  end

  def update
  	product = Product.find(params[:id])
  	product.update(params.require(:product).permit(:name, :price, :description))
    
    product.categories.delete(params[:remove_category]) if params[:remove_category].size > 0
    product.categories << Category.find(params[:add_category]) if params[:add_category].size > 0

  	redirect_to "/products/#{product.id}/show"
  end

  def new
  	@product = Product.new
  end

  def create
  	product = Product.create(params.require(:product).permit(:name, :price, :description))
  	redirect_to "/products/#{product.id}/show"
  end

  def destroy
    Product.find(params[:id]).destroy
  end

end
