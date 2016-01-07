require 'tilt/template'
require 'sassc'

class SassCTemplate < Tilt::Template
  self.default_mime_type = 'text/css'

  def prepare
    @engine = SassC::Engine.new(data, scss_options)
  end

  def evaluate(scope, locals, &block)
    @output ||= @engine.render
  end

  def allows_script?
    false
  end

  private

    def scss_options
      options.merge(:filename => eval_file, :line => line, :syntax => :scss)
    end
    
end

Tilt.register SassCTemplate, :sassc
