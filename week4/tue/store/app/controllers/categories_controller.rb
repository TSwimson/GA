class CategoriesController < ApplicationController
	def index 
		@categories = Category.all
	end

  def show
  	@category = Category.find(params[:id])
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	category = Category.find(params[:id])
  	category.update(params.require(:category).permit(:name, :description))
  	redirect_to "/categories/#{category.id}/show"
  end

  def new
  	@category = Category.new
  end

  def create
  	category = Category.create(params.require(:category).permit(:name, :description))
  	redirect_to "/categories/#{category.id}/show"
  end

  def destroy
  	Category.find(params[:id]).destroy
  end

end
