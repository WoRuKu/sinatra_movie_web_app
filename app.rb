require 'sinatra'
require 'movie'

# Responds to GET requests for "/movies"
get('/movies') do
    # Set up an array of movies
    @movies = []
    # Set up new Movie objects
    @movies[0] = Movie.new 
    @movies[0].title = "Jaws"
    @movies[1] = Movie.new 
    @movies[1].title = "Alien "
    @movies[2] = Movie.new 
    @movies[2].title = "Terminator"
    @movies[3] = Movie.new
    @movies[3].title = "Startrek"

    # Load "views/index.erb"
    erb :index
end

