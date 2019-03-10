require './config/environment'

class ApplicationController < Sinatra::Base
  set :views, Proc.new {File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{recipe.id}"
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch "/recipes/:if" do
    params.delete("_method")
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    redirect "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id" do
    Recipe.find(params[:id]).destroy
    redirect "/recipes"
  end 

end
