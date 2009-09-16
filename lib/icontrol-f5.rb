require "rubygems" # SOAP4R is forcing us to the the gem package manager, sorry.
gem 'soap4r' # See, this is what I was talking about.
require 'soap/wsdlDriver'

require "#{File.dirname(__FILE__)}/icontrol-f5/string"
require "#{File.dirname(__FILE__)}/icontrol-f5/connection"
require "#{File.dirname(__FILE__)}/icontrol-f5/pool"
require "#{File.dirname(__FILE__)}/icontrol-f5/node"

module IControlF5
  WSDL_PATH = File.join(File.dirname(__FILE__), "icontrol-f5", "wsdl")
end

