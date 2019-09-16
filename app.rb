require 'pry'
require 'json'
require 'sinatra'
require 'sinatra/activerecord'

require_relative 'config/settings'
require_relative 'app/models/user'
require_relative 'app/models/example_model'
require_relative 'app/graphql/api_schema'

require "sinatra/reloader" if development?

enable :sessions

helpers do
  def logged_in?
    session[:user_logged_in]
  end

  def protected!
    halt 401,"You are not authorized to see this page!" unless logged_in?
  end
end

get '/' do
  erb :login
end

get '/index' do
  protected!
  erb :index
end

post '/login' do
  user = User.exists?(email: params['email'], password: params['password'])
  session['user_logged_in'] = user
  
  unless user
    @error = true
  end
  
  redirect '/index'
end

post '/logout' do
  session.clear
  redirect '/'
end

get '/examples' do
  ExampleModel.all.to_json
end

post '/graphql' do
  begin
    body = JSON.parse(request.body.string)

    variables       = body["variables"]
    query           = body["query"]
    operation_name  = body["operationName"]
    context = {
      # Query context goes here, for example:
      # current_user: current_user,
    }

    result = ApiSchema.execute(
      query,
      variables: variables,
      context: context,
      operation_name: operation_name
    )

    result.to_json

  rescue Exception => e
    raise e unless development?
    handle_error_in_development e
  end
end

private

def handle_error_in_development(e)
  { status => 500, error => { message => e.message, backtrace => e.backtrace }, data => {} }.to_json
end
