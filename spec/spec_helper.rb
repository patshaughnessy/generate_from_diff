$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib', 'generators', 'generate_from_diff'))

require 'rubygems'
require 'spec'
require 'spec/autorun'
require 'rails/generators'
require 'rails/generators/rails/generator/generator_generator'
require 'generator_from_diff_generator'

module Rails
  class Application
    class << self
      def instance
        'something'
      end
    end
  end
end

Spec::Runner.configure do |config|
end
