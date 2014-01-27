class UrlsController < ApplicationController

    def index
        @urls = []
        if cookies['user_id']
            @urls = Url.find_all_by_user_id(cookies['user_id'])
        else
            cookies.permanent['user_id'] = (User.create).id
        end
    end

    def show
        @url = Url.find(Url.generate_id_from_short(params[:short]))
    end

    def go
        url = Url.find(Url.generate_id_from_short(params[:short]))
        url.increment
        redirect_to url.long
    end

    def create
        url = params[:url][:long]
        url = "http://" + url if URI(url).scheme == nil
        new_url = Url.create(long: url, user_id: cookies['user_id'])
        new_url.generate_short
        redirect_to show_url_path(new_url.short)
    end

end
