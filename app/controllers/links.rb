module Controllers
	class Links < Base

    get '/' do
	  @links = Link.all
	  erb :index
	  end
  
	  post '/links' do
	    url = params["url"]
	    title = params["title"]
  
	    tags = params["tags"].split(",").map do |tag|
	  	  # this will either find this tag or create
	  	  # it if it doesn't exist already
	  	  Tag.first_or_create(:text => tag)
	  	end
	  	Link.create(:url => url, :title => title, :tags => tags)
  
	    redirect to('/')
	  end
  
    get '/tags/:text' do
      tag = Tag.first(:text => params[:text])
      @links = tag ? tag.links : []
      erb :index
    end
	end
end