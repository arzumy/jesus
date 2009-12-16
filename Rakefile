require 'vendor/gems/environment'
require 'spec/rake/spectask'

#
# Jeweler, to execute the tests
#
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "jesus"
    gemspec.summary = "A web interface for god to speak with mankind"
    gemspec.description = "A web interface for god to speak with mankind"
    gemspec.email = "42@dmathieu.com"
    gemspec.homepage = "http://github.com/dmathieu/jesus"
    gemspec.authors = ["Damien MATHIEU"]
    gemspec.version = '1.0.0'
  end
rescue LoadError
  puts "Jeweler not available. Install it with:"
  puts "gem install jeweler"
end


#
# The rspec tasks
#
task :default => :spec

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.spec_opts = ['-cfs']
end

#
# SDoc
#
begin
  require 'sdoc_helpers'
rescue LoadError
  puts "sdoc support not enabled. Please gem install sdoc-helpers."
end