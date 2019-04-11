ENV['SINATRA_ENV'] ||= "development"
HASHKEY = "SxhIwuD2tO792nk2SAF2sp4r7WRYpxqP"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require 'sysrandom/securerandom'
# require './app/controllers/application_controller'
require_all 'app'
require 'pry'
