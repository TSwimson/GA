class BogController < ApplicationController
  def index
    @bogs = Marsh.all
    render :index
  end

  def new
    render :new
  end

  def create
    bog = params.require(:bog).permit(:name,:description)
    new_bog = Marsh.create(bog)
    redirect_to "/bogs/#{new_bog.id}"
  end

  def update
    bog_id = params[:id]
    bog = Marsh.find(bog_id)

    # get updated data
    updated_attributes = params.require(:bog).permit(:name, :description)
    # update the bog
    bog.update_attributes(updated_attributes)

    #redirect to show
    redirect_to "/bogs/#{bog_id}"
  end

  def edit
    bog_id = params[:id]
    @bog = Marsh.find(bog_id)
    render :edit
  end

  def delete
    bog_id = params[:id]
    Marsh.destroy(bog_id)
    redirect_to "/bogs"
  end

  def show
    bog_id = params[:id]
    @bog = Marsh.find(bog_id)
    render :show
  end
end
