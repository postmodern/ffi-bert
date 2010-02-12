# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ffi-bert}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-02-11}
  s.description = %q{FFI bindings to libBERT, a library for the encoding and decoding of BERT data.}
  s.email = %q{postmodern.mod3@gmail.com}
  s.extra_rdoc_files = [
    "ChangeLog.md",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".gitignore",
    ".specopts",
    ".yardopts",
    "ChangeLog.md",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "lib/bert.rb",
    "lib/bert/atom_value.rb",
    "lib/bert/bin_value.rb",
    "lib/bert/data.rb",
    "lib/bert/data_values.rb",
    "lib/bert/dict.rb",
    "lib/bert/dict_node.rb",
    "lib/bert/encoder.rb",
    "lib/bert/errno.rb",
    "lib/bert/extensions.rb",
    "lib/bert/extensions/tuple.rb",
    "lib/bert/ffi.rb",
    "lib/bert/list.rb",
    "lib/bert/list_node.rb",
    "lib/bert/regex_value.rb",
    "lib/bert/string_value.rb",
    "lib/bert/tuple.rb",
    "lib/bert/types.rb",
    "lib/bert/version.rb",
    "spec/bert_spec.rb",
    "spec/data_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/postmodern/ffi-bert}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{FFI bindings to libBERT.}
  s.test_files = [
    "spec/spec_helper.rb",
    "spec/bert_spec.rb",
    "spec/data_spec.rb",
    "spec/encoder_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, [">= 0.6.0"])
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_development_dependency(%q<yard>, [">= 0.5.3"])
    else
      s.add_dependency(%q<ffi>, [">= 0.6.0"])
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_dependency(%q<yard>, [">= 0.5.3"])
    end
  else
    s.add_dependency(%q<ffi>, [">= 0.6.0"])
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
    s.add_dependency(%q<yard>, [">= 0.5.3"])
  end
end
