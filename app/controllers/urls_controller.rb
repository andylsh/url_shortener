class UrlsController < ApplicationController
	def index
        @urls = Url.all
    end

    def show
    	@url = Url.find(params[:id])
	end

	def new
  		@url = Url.new
	end

	def create
	 		@url = Url.new(url_params)
	  		@url.shorten
  		if @url.save
      		redirect_to @url  
  		else
      		render 'new'
  		end   
	end

	 def destroy
	    @url = Url.find(params[:id])
	    @url.destroy
	    redirect_to urls_path
	end
	
	def short
    	url = Url.find(params[:id])
    	redirect_to url.long_url    
	end 
	
	private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def url_params
      params.require(:url).permit(:long_url)
    end

	
end
