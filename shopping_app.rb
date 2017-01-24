require 'sinatra'
require 'sinatra/reloader'

# Practice with Query String Params

get '/' do
  @name = params["name"]
  @price = params["price"]
  erb :index
end

get '/items' do
  #here is where it's supposed to be the code
end

get '/cart' do
  @item = params["item"]
  @price = params["price"]
  erb :cart
end

# Practice with Form Params

get '/items/new' do
  @item = params["item"]
  @price = params["price"]
  erb :new_item
end

post '/items' do
  @item = params["item"]
  @price = params["price"]
  erb :cart
end

get '/users/new' do
  erb :new_user
end

post '/users' do
  @username = params["username"]
  @password = params["password"]
  erb :user
end
