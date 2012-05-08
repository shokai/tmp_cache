# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "tmp_cache"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sho Hashimoto"]
  s.date = "2012-05-08"
  s.description = "on memory cache."
  s.email = ["hashimoto@shokai.org"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "lib/tmp_cache.rb", "script/console", "script/destroy", "script/generate", "test/test_helper.rb", "test/test_tmp_cache.rb", "samples/sample.rb", ".gemtest"]
  s.homepage = "http://github.com/shokai/tmp_cache"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "tmp_cache"
  s.rubygems_version = "1.8.17"
  s.summary = "on memory cache."
  s.test_files = ["test/test_helper.rb", "test/test_tmp_cache.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<newgem>, [">= 1.5.3"])
      s.add_development_dependency(%q<hoe>, ["~> 2.15"])
    else
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<newgem>, [">= 1.5.3"])
      s.add_dependency(%q<hoe>, ["~> 2.15"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<newgem>, [">= 1.5.3"])
    s.add_dependency(%q<hoe>, ["~> 2.15"])
  end
end
