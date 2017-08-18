require 'sinatra'
require 'movie'
require 'movie_store'

# Create a MovieStore that updates the movies yml file
store = MovieStore.new('movies.yml')

# Responds to GET requests for "/movies"
get ('/movies') do
  # Load all Movie objects from movies.yml  
  @movies = store.all
  # Load "views/index.erb"
  erb :index
end

get ('/movies/new') do
  # Load "views/new.erb" 
  erb :new
end

# Handle POST requests for "/moview/create"
post ('/movies/create') do
  @movie = Movie.new
  # Assign the contents of the form fields to attributes of the objects
  @movie.title = params['title']
  @movie.director = params['director'] 
  @movie.year = params['year']
  # Save the object
  store.save(@movie)
  # Show a new, empty form
  redirect '/movies/new'
end

get ('/movies/:id') do
  id = params['id'].to_i
  # Use the ID to load the movie from the store
  @movie = store.find(id)
  # Embed the movie in the HTML from show.erb and 
  # return it to the browser
  erb :show
end