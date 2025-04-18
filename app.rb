require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
require "http"

get("/") do
  @raw_response = HTTP.get("https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}")

  @string_response = @raw_response.to_s

  @parsed_response = JSON.parse(@string_response)

  @currencies = @parsed_response.fetch("currencies")

  erb(:homepage)
end

get("/:first_symbol") do 
  @the_symbol = params.fetch("first_symbol")

  @url = "https:api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY").chomp}"

  @raw_response = HTTP.get(@url)

  @string_response = @raw_response.to_s

  @parsed_response = JSON.parse(@string_response)

  @currencies = @parsed_response.fetch("currencies")

  erb(:step_one)
end

get("/:from_currency/:to_currency") do 
    @from = params.feetch("from_currency")
    @to = params.fetch("to_currency")

    @url = "https://api.exchangerate.host/convert?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY").chomp}&from=#{@from}&to=#{@to}&amount=1"

    @raw_response = HTTP.get(@url)

    @string_response = @raw_response.to_s

    @parsed_response = JSON.parse(@string_response)

    @amount = @parsed_response.fetch("result")

    erb(:step_two)
end 
