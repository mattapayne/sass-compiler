require 'sinatra/base'
require 'compass'

module Sinatra
  module Thinkific
    module AppConfig
      def set_compass_config
        configure do
          Compass.add_project_configuration(File.join(settings.root, 'config', 'compass.rb'))
        end
      end
    end
  end
  register Thinkific::AppConfig
end
