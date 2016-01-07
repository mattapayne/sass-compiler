require 'sinatra/base'
require 'liquid'
require 'sass'
require 'compass'
require 'byebug'
require './lib/sassc_template_engine'
require './lib/rendering_helpers'
require './config/app_config'

module Thinkific
  class SassCompilerApp < Sinatra::Application

    helpers RenderingHelpers
    set_compass_config

    get '/foundation_css/:id' do
      #TODO - Add code to pull the specific tenant's custom css, rather than load it from
      #the filesystem
      scss_content = liquid :style, locals: {"brandColor" => '#DCDCDC'}, views: "views/stylesheets"
      sassc scss_content, Compass.sass_engine_options.merge(:style => :compressed)
    end

    run! if app_file == $0
  end
end
