ENV['SINATRA_ENV'] ||= "development"

HASHKEY = "894b68302cdfd6479cef84b8388689230d12886afdf02e09ee3605b42dcc68bf"


require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

# require 'sysrandom/securerandom'
# require './app/controllers/application_controller'
require_all 'app'
