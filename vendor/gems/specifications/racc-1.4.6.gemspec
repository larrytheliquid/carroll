# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{racc}
  s.version = "1.4.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aoki Minero", "Aaron Patterson"]
  s.date = %q{2009-01-02}
  s.description = %q{Racc is a LALR(1) parser generator. It is written in Ruby itself, and generates Ruby program.}
  s.email = %q{aaronp@rubyforge.org}
  s.executables = ["racc", "racc2y", "y2racc"]
  s.extensions = ["ext/racc/cparse/extconf.rb"]
  s.files = [".gitattributes", ".gitignore", "COPYING", "ChangeLog", "DEPENDS", "README.en.rdoc", "README.ja.rdoc", "Rakefile", "TODO", "bin/racc", "bin/racc2y", "bin/y2racc", "doc/en/NEWS.en.rdoc", "doc/en/command.en.html", "doc/en/debug.en.rdoc", "doc/en/grammar.en.rdoc", "doc/en/index.en.html", "doc/en/parser.en.rdoc", "doc/en/usage.en.html", "doc/ja/NEWS.ja.rdoc", "doc/ja/command.ja.html", "doc/ja/debug.ja.rdoc", "doc/ja/grammar.ja.rdoc", "doc/ja/index.ja.html", "doc/ja/parser.ja.rdoc", "doc/ja/usage.ja.html", "ext/racc/cparse/MANIFEST", "ext/racc/cparse/cparse.c", "ext/racc/cparse/depend", "ext/racc/cparse/extconf.rb", "fastcache/extconf.rb", "fastcache/fastcache.c", "lib/racc.rb", "lib/racc/compat.rb", "lib/racc/debugflags.rb", "lib/racc/exception.rb", "lib/racc/grammar.rb", "lib/racc/grammarfileparser.rb", "lib/racc/info.rb", "lib/racc/iset.rb", "lib/racc/logfilegenerator.rb", "lib/racc/parser.rb", "lib/racc/parserfilegenerator.rb", "lib/racc/pre-setup", "lib/racc/sourcetext.rb", "lib/racc/state.rb", "lib/racc/statetransitiontable.rb", "lib/racc/static.rb", "misc/dist.sh", "sample/array.y", "sample/array2.y", "sample/calc-ja.y", "sample/calc.y", "sample/conflict.y", "sample/hash.y", "sample/lalr.y", "sample/lists.y", "sample/syntax.y", "sample/yyerr.y", "setup.rb", "tasks/doc.rb", "tasks/email.rb", "tasks/file.rb", "tasks/gem.rb", "tasks/test.rb", "test/assets/chk.y", "test/assets/conf.y", "test/assets/digraph.y", "test/assets/echk.y", "test/assets/err.y", "test/assets/expect.y", "test/assets/firstline.y", "test/assets/ichk.y", "test/assets/intp.y", "test/assets/mailp.y", "test/assets/newsyn.y", "test/assets/noend.y", "test/assets/nonass.y", "test/assets/normal.y", "test/assets/norule.y", "test/assets/nullbug1.y", "test/assets/nullbug2.y", "test/assets/opt.y", "test/assets/percent.y", "test/assets/recv.y", "test/assets/rrconf.y", "test/assets/scan.y", "test/assets/syntax.y", "test/assets/unterm.y", "test/assets/useless.y", "test/assets/yyerr.y", "test/bench.y", "test/helper.rb", "test/infini.y", "test/scandata/brace", "test/scandata/gvar", "test/scandata/normal", "test/scandata/percent", "test/scandata/slash", "test/src.intp", "test/start.y", "test/test_chk_y.rb", "test/test_grammar_file_parser.rb", "test/test_racc_command.rb", "test/test_scan_y.rb", "test/testscanner.rb", "web/racc.en.rhtml", "web/racc.ja.rhtml", "lib/racc/parser-text.rb"]
  s.homepage = %q{http://racc.rubyforge.org/}
  s.rdoc_options = ["--main", "README.en.rdoc"]
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{racc}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Racc is a LALR(1) parser generator.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
