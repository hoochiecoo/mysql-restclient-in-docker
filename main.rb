require 'mysql2'
require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

Mysqlclient = Mysql2::Client.new(
    host: 'mys',
      username: 'root',
        password: 'rootpassword',
          database: 'mysql')

def get_top_fruits
        Mysqlclient.query('select 1 =1', :as => :hash).to_a
end

get '/' do
    Mysqlclient.server_info
end

get '/ready' do
   Mysql.query('select 1=1', :as => :hash).to_a
end

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  "Hello #{params['name']}!"
  begin
  puts params['name']
  Mysqlclient.server_info
  puts 'norm'
  rescue
  puts 'rescue'
  end
end
