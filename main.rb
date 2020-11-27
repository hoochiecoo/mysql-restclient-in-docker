require 'mysql2'
require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

Mysqlclient = Mysql2::Client.new(
    host: 'mys',
    username: 'root',
    password: 'rootpassword',
    database: 'mysql')

post '/payload' do
  content_type 'application/json'
  push = request.body.read
  puts push
  Mysqlclient.query(push, :as => :hash).to_a.to_json
end
