class SitesController < ApplicationController
  def new
    @site = Site.new
     respond_to do |f|
      f.html
      f.json {render json: {},status: 404}
     end
  end

  def delete
    Site.find(params[:id]).destroy
    respond_to do |f|
      f.html { redirect_to 'index'}
      f.json { render json: {},status: 200 }
    end
  end

  def create
    url = params.require(:site)[:url]
    @site = Site.create(url: url)
    LinksWorker.perform_async(@site.id)
    respond_to do |f|
      f.html { redirect_to site_path(@site) }
      f.json { render :json => @site }
    end
  end

  def show
    @site = Site.find(params[:id])
    @links = @site.links
    respond_to do |f|
      f.html
      f.json { render :json => @site.as_json(include: :links)}
    end
  end

  def edit
    respond_to do |f|
      f.html do
        @site = Site.find(params[:id])
      end
      f.json { render json: {}, status: 404 }
    end
  end

  def linkfarm
    respond_to do |f|
      f.html
      f.json { render json: Link.all }
    end
  end

  rescue_from ActionController::ParameterMissing, :only => :create do |err|
    respond_to do |f|
      f.html do
        redirect_to new_site_path
      end
      f.json {render :json  => {:error => err.message}, :status => 422}
    end
  end

  # rescue_from ActionController::ParameterMissing, :handle_create_param_missing :only => :create
  #
  # def handle_create_param_missing
  #    respond_to do |f|
  #     f.html do
  #       redirect_to new_site_path
  #     end
  #     f.json {render :json  => {:error => err.message}, :status => 422}
  #   end
  # #
end
