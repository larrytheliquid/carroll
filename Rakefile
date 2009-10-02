require "rake"
require "spec/rake/spectask"

desc "Compile Carroll"
task :compile do
  Rake::Task['compile:parser'].execute  
end

namespace :compile do
  desc "(Re)generate parser from grammar"
  task :parser do
    `#{File.dirname(__FILE__)}/bin/racc #{File.dirname(__FILE__)}/carroll/grammar.y -o #{File.dirname(__FILE__)}/carroll/parser.rb`
  end
end

desc "Run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
end

namespace :spec do
  desc "Run lexer specs"
  Spec::Rake::SpecTask.new :lexer do |t|
    t.spec_files = FileList["#{File.dirname(__FILE__)}/spec/lexer_spec.rb"]
    t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
  end

  desc "Run parser specs"
  Spec::Rake::SpecTask.new :parser do |t|
    t.spec_files = FileList["#{File.dirname(__FILE__)}/spec/parser_spec.rb"]
    t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
  end

  desc "Run runtime specs"
  Spec::Rake::SpecTask.new :runtime do |t|
    t.spec_files = FileList["#{File.dirname(__FILE__)}/spec/runtime_spec.rb"]
    t.spec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
  end
end
