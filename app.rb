require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require_relative 'app/models/example_model'

set :database_file, 'config/database.yml'

get '/examples' do
  @examples = ExampleModel.all
  @examples.to_json
end

post '/graphql' do

end
