class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    redirect '/recipes'
  end
  
  #index action
  get '/recipes' do
    @recipes = Recipe.all
    erb :'/index'
  end
  
  #new action - WHY DO THESE HAVE TO GO FIRST?
  get '/recipes/new' do
    erb :'/new'
  end
  
  #show action
  get '/recipes/:id' do
    @recipe = Recipe.find_by(params[:id])
    erb :'/show'
  end
  
  #new action
  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    # @recipe.save
    # binding.pry
    redirect "/recipes/#{@recipe.id}"
  end
  
  #edit action
  get '/recipes/:id/edit' do  
    @recipe = Recipe.find(params[:id])
    erb :'/edit'
  end
  
  #delete action
  delete '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect to '/index'
  end

end
