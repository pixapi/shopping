require 'sinatra'
require 'sinatra/reloader'

# Practice with Query String Params

get '/' do
  @name = params["name"]

  erb :index
end

# Practice with Form Params

get '/items/new' do
  erb :new_item
end

post '/items' do
  erb :cart
end

get '/users/new' do
  erb :new_user
end
