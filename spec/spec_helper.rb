require 'vendor/gems/environment'
require 'sinatra'
require 'rack/test'
require 'spec'
require 'spec/autorun'
require 'spec/interop/test'

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'jesus/server'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false