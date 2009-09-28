require "rake"
require "spec/rake/spectask"

desc "Run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
end
desc "Run all specs"
task :default => :spec

desc "Run lexer specs"
Spec::Rake::SpecTask.new('lexer') do |t|
  t.spec_files = FileList["#{File.dirname(__FILE__)}/spec/lexer_spec.rb"]
  t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
end
