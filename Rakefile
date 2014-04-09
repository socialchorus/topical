require "bundler/gem_tasks"

require 'rake/testtask'

desc "run all the specs"
task :spec do
  $: << File.dirname(__FILE__)

  require 'lib/topical'

  Dir.glob("spec/support/**/*.rb").each {|f| require f}
  Dir.glob('./spec/**/*_spec.rb').each { |file| require file}
end
