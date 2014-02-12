class SnippetsController < ApplicationController
  def new
    @snippet = Snippet.new
  end

  def show
    @snippet = Snippet.find(snippet_id)
  end

  def create
    @snippet = Snippet.create(snippet_params)
    if @snippet.save
        uri = URI.parse("http://pygments.appspot.com/")
        request = Net::HTTP.post_form(uri, {lang: "Ruby", code: @snippet.plane_code})
        @snippet.update_attributes(highlighted_code: request.body)
        binding.pry
        redirect_to @snippet
    else
        redirect :new
    end
  end

  private
  def snippet_id
    params[:id]
  end

  def snippet_params
    params.require(:snippet).permit(:plane_code)
  end
end
