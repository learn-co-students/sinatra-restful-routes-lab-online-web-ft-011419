class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
get '/recipes' do 
  @recipes = Recipe.all 
erb :index
end

get '/recipes/new' do
erb :new
end

post  '/recipes' do
var = Recipe.create(params)
redirect "/recipes/#{var.id}"
end

get '/recipes/:id' do 
 @recipe =Recipe.find(params[:id])
erb  :show
end

delete '/recipes/:id' do 
recipe =Recipe.find_by_id(params[:id])
recipe.delete
redirect '/recipes'
end

get '/recipes/:id/edit' do 
  @recipe =Recipe.find(params[:id])
 erb  :edit
 end

patch  '/recipes/:id'  do 
 
  var = Recipe.find_by_id(params[:id])
  var.name = params[:name]
  var.ingredients = params[:ingredients]
  var.cook_time = params[:cook_time]
  var.save
  redirect "/recipes/#{var.id}"
end



end