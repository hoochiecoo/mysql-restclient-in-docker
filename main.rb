require 'mysql2'
require 'sinatra'
require 'json'
require 'uri'


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

get '/sql-json/:query' do |query|
  content_type 'application/json'
  decoded = URI.decode_www_form_component(query)
  puts decoded
  Mysqlclient.query(decoded, :as => :hash).to_a.to_json
end

get '/sql-xml/:query' do |query|
  content_type 'text/xml'
  decoded = URI.decode_www_form_component(query)
  puts decoded
  Mysqlclient.query(decoded, :as => :hash).to_a.to_xml
end
