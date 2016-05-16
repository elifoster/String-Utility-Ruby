task :default do
  sh "cd #{File.dirname(__FILE__)}/ext && make"
  require_relative 'spec/testcases'
end

task :compile do
  sh "cd #{File.dirname(__FILE__)}/ext && make"
end