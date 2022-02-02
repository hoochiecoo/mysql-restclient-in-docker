require 'mysql2'
require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

Mysqlclient = Mysql2::Client.new(
    host: ENV['MYSQL_RESTCLIENT_HOST'],
    username: ENV['MYSQL_RESTCLIENT_USERNAME'],
    password: ENV['MYSQL_RESTCLIENT_PASSWORD'],
    database: ENV['MYSQL_RESTCLIENT_DB'])

post '/payload' do
  content_type 'application/json'
  push = request.body.read
  puts push
  Mysqlclient.query(push, :as => :hash).to_a.to_json
end

get '/sql/:query' do |query|
  content_type 'application/json'
  puts query
  Mysqlclient.query(query, :as => :hash).to_a.to_json
end
