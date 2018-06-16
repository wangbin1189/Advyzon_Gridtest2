# app.rb
require 'pry'
require 'sinatra'
require 'sinatra/activerecord'
require 'json'

set :database, "sqlite3:project-name.sqlite3"
require './models.rb'


get '/' do
  File.read(File.join('public', 'beautifulGrid.html'))
end

# index
get '/users' do
  users = User.all
  users.to_json(except: [:created_at, :updated_at])
end

# show
# get '/users/:id' do
#   user = User.find(params[:id])
# end

# create
post '/users' do
  # TODO: whitelist parameters
  params = JSON.parse request.body.read
  user = User.create(params)
  if user.save
    {success: true}
  else
    status 400
  end
end

# update
# http://localhost:4567/users/3
put '/users/:id' do
  params = JSON.parse request.body.read
  found_user = User.find(params['id'])
  if !found_user
    return status 404
  end

  found_user.update_attributes(params.except('id'))
  if found_user.save
    {success: true}
  else
    status 400
  end
end

# delete
delete '/users/:id' do
  user = User.find(params[:id])
  if user.destroy!
    { success: true}
  else
    status 400
  end
end
