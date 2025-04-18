require "sinatra"
require "sinatra/reloader"
require "dotenv/load"

get("/") do
  erb(:homepage)
end
