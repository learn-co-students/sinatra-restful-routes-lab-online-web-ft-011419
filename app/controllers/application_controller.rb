class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/' do
    erb :index
  end

  get '/recipes' do
    erb :new
  end

  


end
