require './config/environment'

class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # 6. index action
  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  # 3. new action - form
  get "/recipes/new" do
    erb :new
  end

  # 3.2 new action - create
  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  # 4. display single action
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # 5. edit action - form
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  # 5.2 edit action - post
  patch "/recipes/:id" do
    params.delete("_method")
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    redirect "/recipes/#{@recipe.id}"
  end

  # 7. delete action
  delete "/recipes/:id" do
    Recipe.find(params[:id]).destroy
    redirect "/recipes"
  end


end
