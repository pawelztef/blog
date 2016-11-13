# -*- encoding: utf-8 -*-
# stub: prism-rails 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "prism-rails"
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Avi Charlop"]
  s.date = "2016-05-25"
  s.email = "avicharlop@gmail.com"
  s.homepage = "https://github.com/acharlop/prism-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "prism-rails wraps the Prism.js library in a rails engine for simple use with the asset pipeline"

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.11"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<uglifier>, [">= 0"])
    else
      s.add_dependency(%q<railties>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.11"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<uglifier>, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.11"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<uglifier>, [">= 0"])
  end
end
