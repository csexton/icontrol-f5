$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'icontrol-f5'
require 'spec'
require 'spec/autorun'

require 'yaml'
config_file = File.join(File.dirname(__FILE__), "spec_config.yml")
$spec_config = YAML::load_file(config_file)
Spec::Runner.configure do |config|
  
end
