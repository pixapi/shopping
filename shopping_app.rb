require 'sinatra'
require 'sinatra/reloader'

# Practice with Query String Params

get '/' do
  @name = params["name"]

  erb :index
end

