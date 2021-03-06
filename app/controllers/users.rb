module Controllers
	class Users < Base

  get '/users/new' do
  # note the view is in views/users/new.erb
  # we need the quotes because otherwise
  # ruby would divide the symbol :users by the
  # variable new (which makes no sense)
      @user = User.new
      erb :"users/new"
    end
    
    post '/users' do
      @user = User.create(
      	           :email                 => params[:email], 
                   :password              => params[:password],
                   :password_confirmation => params[:password_confirmation])
  
      if @user.save
        session[:user_id] = @user.id
        redirect to('/')
      else
      	flash[:errors] = @user.errors.full_messages
        erb :"users/new"
      end
    end
	end
end