module Dbconfig
  class Initialise < Sinatra::Base
  
    env = ENV["RACK_ENV"] || "development"
    
    #puts "hello mum"
    # we're telling datamapper to use a postgres database on localhost. 
    #The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
    #                           dbtype:  //user:password@hostname:port/databasename
    
    DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
    
    Dir.glob(File.join(File.dirname(__FILE__), 'models', '*.rb'), &method(:require))
    
    DataMapper.finalize
    
    # However, the database tables don't exist yet. Let's tell datamapper to create them
    DataMapper.auto_upgrade!
  
  end
end