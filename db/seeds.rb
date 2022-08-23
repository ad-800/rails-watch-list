require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require_relative 'scrape'

# PARAMETERS
country = 'pt'
service = 'netflix' # prime, disney, hbo, hulu, peacock, paramount, starz, showtime, apple
type = 'movie' # or series
genre = ''
page = 1
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
  # Search for metacritic rating on imdb .score-meta
  puts "Calculating #{result['title']}"
  next if result['imdbRating'].to_i <= 60

  movies = { title: result['title'],
             year: result['year'],
             cast: result['cast'],
             genres: result['genre'],
             overview: result['overview'],
             poster: result['posterPath'],
             imdb_rating: result['imdbRating'],
             meta_rating: scrape_meta("https://www.imdb.com/title/#{result['imdbID']}/"),
             rotten_rating: scrape_rotten("https://www.rottentomatoes.com/m/#{result['title'].gsub(/[#^&@.]/, '').gsub(/\s/, '_')}") }

  next if movies[:meta_rating].zero? && movies[:rotten_rating].nil?

  Movie.create(movies)
end
