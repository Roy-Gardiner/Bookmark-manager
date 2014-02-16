require 'data_mapper'
require 'sinatra'

require_relative 'db_config'
require_relative 'controllers/base'
#puts " #{Dir.glob(File.join(File.dirname(__FILE__), 'controllers', '*.rb'))}"
#puts "======================================="
#Dir.glob(File.join(File.dirname(__FILE__), 'controllers', '*.rb'), &method(:require))

class BookmarkManager < Sinatra::Base

  use Dbconfig::Initialise
  
	use Controllers::Links
  use Controllers::Users
  use Controllers::Authentication
  
end
