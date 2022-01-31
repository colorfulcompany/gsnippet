# frozen_string_literal: true

require_relative "lib/gsnippet/version"

Gem::Specification.new do |spec|
  spec.name = "gsnippet"
  spec.version = Gsnippet::VERSION
  spec.authors = ["cc-kawakami"]
  spec.email = ["kawakami-moeki@colorfulcompany.co.jp"]

  spec.summary = "A Ruby helper that provides Google HTML Snippets."
  spec.description = "A Ruby helper that provides Google HTML Snippets."
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["source_code_uri"] = "https://github.com/colorfulcompany/gsnippet"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "thor"
  spec.add_dependency "nokogiri"
end
