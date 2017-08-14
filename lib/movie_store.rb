# Load the YAML::Store class
require 'yaml/store'

class MovieStore

  def initialize(file_name)
    # Create a store that reads/writes the given file_name
    @store = YAML::Store.new(file_name)
  end
  
  # Saves a Movie to the store
  def save(movie)
    @store.transaction do
      # if the movie doesn't have an ID
      unless movie.id 
        # find the highest key  
        highest_id = @store.roots.max || 0
        # and increment it 
        movie.id = highest_id + 1
      end
      @store[movie.id] = movie
    end
  end

  # Retrieves all movies in the store
  def all
    # Accessing the store requires a transaction  
    @store.transaction do
      # Create an array with the values for each key  
      @store.roots.map { |id| @store[id] }
    end
  end

end