require 'tty/prompt'
require 'bundler'
require 'sinatra/activerecord'
Bundler.require






ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil

require_all 'lib'
require_all 'app'

SINATRA_ACTIVESUPPORT_WARNING=false #doesn't work. the liars!