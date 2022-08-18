# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'uri'
require 'net/http'
require 'openssl'
require 'json'

puts "Planting seeds"

country = 'pt'
service = 'netflix' # prime, disney, hbo, hulu, peacock, paramount, starz, showtime, apple
type = 'movie' # or series
genre = ''
page = 6
url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=#{country}&service=#{service}&type=#{type}&genre=#{genre}&page=#{page}&output_language=en&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request['X-RapidAPI-Key'] = 'e4706810edmsh76a8aeb1b1ef015p170630jsneaab7251f736'
request['X-RapidAPI-Host'] = 'streaming-availability.p.rapidapi.com'

response = http.request(request)

db = JSON.parse(response.read_body)

db['results'].each do |result|
  puts "Calculating #{result['title']}"

  movie = { title: result['title'],
            overview: result['overview'],
            poster_url: "https://image.tmdb.org/t/p/original#{result['posterPath']}",
            rating: result['imdbRating'] }

  Movie.create(movie)
end

puts "Finished gardening"
