require_relative '../helpers/application'
require 'rack-flash'

module Controllers
  class Base < Sinatra::Base
    enable :sessions
    set :session_secret, 'Secret'

    use Rack::Flash
    use Rack::MethodOverride

    helpers ApplicationHelper

 #   Dir.glob(File.dirname(__FILE__) + '/*.rb', &method(:require))
    Dir.glob(File.join(File.dirname(__FILE__), '*.rb'), &method(:require))
                

    set :views, File.join(File.dirname(__FILE__), '../views')
  end
end
