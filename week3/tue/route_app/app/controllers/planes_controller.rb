class PlanesController < ApplicationController

    def index
        # Note it used to say 
        #   render text: 'Hello, pilots'
        @planes = Plane.all
        render :index
    end

    def new
        render :new
    end

    def create
        plane = params.require(:plane).permit(:name, :engine_type, :description)
        Plane.create(plane)
        redirect_to "/planes"
    end

end