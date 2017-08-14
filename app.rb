require 'sinatra'

# Responds to GET requests for "/movies"
get('/movies') do 
    # Load "views/index.erb"
    erb :index
end

