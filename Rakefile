require "rake"
require "spec/rake/spectask"

namespace :compile do
  desc "(re)generate parser from grammar"
  task :parser do
    `#{File.dirname(__FILE__)}/bin/racc #{File.dirname(__FILE__)}/carroll/grammar.y -o #{File.dirname(__FILE__)}/carroll/parser.rb`
  end
end

desc "run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
end

namespace :spec do
  desc "run lexer specs"
  Spec::Rake::SpecTask.new :lexer do |t|
    t.spec_files = FileList["#{File.dirname(__FILE__)}/spec/lexer_spec.rb"]
    t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
  end

  desc "run parser specs"
  Spec::Rake::SpecTask.new :parser do |t|
    t.spec_files = FileList["#{File.dirname(__FILE__)}/spec/parser_spec.rb"]
    t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
  end
end
