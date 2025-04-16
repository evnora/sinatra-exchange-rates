require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end
