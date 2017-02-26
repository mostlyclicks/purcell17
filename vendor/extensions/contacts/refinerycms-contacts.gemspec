# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = "refinerycms-contacts"
  s.version           = "1.0.0"
  s.description       = "Ruby on Rails Contacts forms-extension for Refinery CMS"
  s.date              = "2017-02-25"
  s.summary           = "Contacts forms-extension for Refinery CMS"
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = "mostlyClicks, Inc."

  # Runtime dependencies
  s.add_dependency    "refinerycms-core",     "~> 3.0.5"
  s.add_dependency    "refinerycms-settings", "~> 3.0.0"
  s.add_dependency    "filters_spam", "~> 0.3"
  s.add_dependency    "actionmailer"

  # Development dependencies (usually used for testing)
  s.add_development_dependency "refinerycms-testing", "~> 3.0.5"
end
