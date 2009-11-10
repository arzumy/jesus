#!/usr/bin/env ruby
require 'logger'

# We require the bundled gems
require 'vendor/gems/environment'

# We require the application
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')
require 'jesus/server'

# We start the server
use Rack::ShowExceptions
run Jesus::Server.new