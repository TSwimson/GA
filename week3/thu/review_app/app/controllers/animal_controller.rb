class AnimalController < ApplicationController

    def index
        @animals = Animal.all
        render :index
    end

    def create
        new_animal = params.require(:animal).permit(:name, :species, :age, :nickname, :status, :description)
        animal = Animal.create(new_animal)
        redirect_to animal
    end

    def new
        @animal = Animal.new
    end

    def show
        id = params[:id]
        @animal = Animal.find(id)
    end

    def edit
        @animal = Animal.find(params[:id])
    end

    def update
        Animal.find(params[:id]).update_attributes(params.require(:animal).permit(:name, :species, :age, :nickname, :status, :description))
        redirect_to animal_path(params[:id])
    end

end
