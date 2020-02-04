class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  #index action
  get '/' do
    @recipes = Recipe.all
    erb :index
  end
  
  #index action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  #new action - has to be first
  get '/recipes/new' do
    erb :new
  end
  
  #new action
  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end
  
  #edit action
  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  #edit action
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
  
  #patch action
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  
  #delete action 
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
  
end