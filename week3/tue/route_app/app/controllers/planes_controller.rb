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

    def show
        plane_id = params[:id]
        @plane = Plane.find(plane_id)
        render :show
    end

    def create
        plane = params.require(:plane).permit(:name, :engine_type, :description)
        new_plane = Plane.create(plane)
        redirect_to "/planes/#{new_plane.id}"
    end

    def edit
        plane_id = params[:id]
        @plane = Plane.find(plane_id)
        render :edit
    end

    def update
        plane_id = params[:id]
        plane = Plane.find(plane_id)

        # get updated data
        updated_attributes = params.require(:plane).permit(:name, :type, :description)
        # update the plane
        plane.update_attributes(updated_attributes)

        #redirect to show
        redirect_to "/planes/#{plane_id}"
    end

end