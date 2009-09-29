require "rake"
require "spec/rake/spectask"

desc "(re)generate parser from grammar"
task 'gen:parser' do
  `racc #{File.dirname(__FILE__)}/carroll/grammar.y -o #{File.dirname(__FILE__)}/carroll/parser.rb`
end

desc "run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
end
desc "run all specs"
task :default => :spec

desc "run lexer specs"
Spec::Rake::SpecTask.new('spec:lexer') do |t|
  t.spec_files = FileList["#{File.dirname(__FILE__)}/spec/lexer_spec.rb"]
  t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
end

desc "run parser specs"
Spec::Rake::SpecTask.new('spec:parser') do |t|
  t.spec_files = FileList["#{File.dirname(__FILE__)}/spec/parser_spec.rb"]
  t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
end
