require 'sinatra'
require 'active_record'
require_relative 'composer'
require_relative 'piece'
require_relative 'environment'

after do
  ActiveRecord::Base.connection.close
end

get '/api/composers' do
  composers = Composer.all
  composers.to_json
end

post '/api/composers' do
  composer = Composer.new(name: params[:name], period: params[:period])
  if composer.valid? && composer.save
    status 201
    composer.to_json
  else
    status 400
  end
end

get '/api/composers/:id' do |id|
  composer = Composer.find_by(id: id)
  composer.to_json
end

put '/api/composers/:id' do
  id = params['id']
  name = params['name']
  period = params['period']
  composer = Composer.find_by(id: id)
  composer.update(name: name, period: period)
  composer.to_json
end

delete '/api/composers/:id' do
  id = params['id']
  composer = Composer.find_by(id: id)
  composer.destroy
  nil
end
#put '/api/composers/:id' do

#end

#delete '/api/composers/:id' do

#end




get '/api/pieces' do
  pieces = Piece.all
  status 200
  pieces.to_json
end

post '/api/pieces' do
  piece = Piece.new(name: params[:name], composer_id: params[:composer_id])
  if piece.valid? && piece.save
    status 201
    piece.to_json
  else
    status 400
  end
end

get '/api/pieces/:id' do |id|
  piece = Piece.find_by(id: id)
  piece.to_json
end

put '/api/pieces/:id' do
  id = params['id']
  name = params['name']
  composer_id = params['composer_id']
  piece = Piece.find_by(id: id)
  piece.update(name: name, composer_id: composer_id)
  piece.to_json
end

delete '/api/pieces/:id' do
  id = params['id']
  piece = Piece.find_by(id: id)
  piece.destroy
  nil
end
#Piece.order(name: something)
#put '/api/pieces/:id' do
#piece.delete
#end

#delete '/api/pieces/:id' do

#end
