Gem::Specification.new do |s|
  s.name = %q{attachment_fu}
  s.version = "0.0.1"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Siebert"]
  s.autorequire = %q{attachment_fu}
  s.date = %q{2008-01-09}
  s.description = %q{Merb plugin that provides a port of attachment_fu to merb}
  s.email = %q{siebertm85@googlemail.com}
  s.extra_rdoc_files = ["README"]
  s.files = ["README", "Rakefile", "lib/amazon_s3.yml.tpl", "lib/attachment_fu.rb", "lib/attachment_fu", "lib/attachment_fu/backends", "lib/attachment_fu/backends/db_file_backend.rb", "lib/attachment_fu/backends/file_system_backend.rb", "lib/attachment_fu/backends/s3_backend.rb", "lib/attachment_fu/processors", "lib/attachment_fu/processors/image_science_processor.rb", "lib/attachment_fu/processors/mini_magick_processor.rb", "lib/attachment_fu/processors/rmagick_processor.rb", "lib/attachment_fu.rb", "lib/geometry.rb", "lib/tempfile_ext.rb", "lib/test", "lib/test/amazon_s3.yml", "lib/test/backends", "lib/test/backends/db_file_test.rb", "lib/test/backends/file_system_test.rb", "lib/test/backends/remote", "lib/test/backends/remote/s3_test.rb", "lib/test/base_attachment_tests.rb", "lib/test/basic_test.rb", "lib/test/database.yml", "lib/test/extra_attachment_test.rb", "lib/test/fixtures", "lib/test/fixtures/attachment.rb", "lib/test/fixtures/files", "lib/test/fixtures/files/fake", "lib/test/fixtures/files/fake/rails.png", "lib/test/fixtures/files/foo.txt", "lib/test/fixtures/files/rails.png", "lib/test/geometry_test.rb", "lib/test/processors", "lib/test/processors/image_science_test.rb", "lib/test/processors/mini_magick_test.rb", "lib/test/processors/rmagick_test.rb", "lib/test/schema.rb", "lib/test/test_helper.rb", "lib/test/validation_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://merb-plugins.rubyforge.org/attachment_fu/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.0.1}
  s.summary = %q{Merb plugin that provides a port of attachment_fu to merb}

  s.add_dependency(%q<merb>, [">= 0.5.0"])
end
