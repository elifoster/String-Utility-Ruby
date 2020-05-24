Gem::Specification.new do |s|
  s.authors = ['Eli Foster']
  s.name = 'string-utility'
  s.summary = 'Provides some basic utilities for interacting with Strings'
  s.version = '3.0.0'
  s.license = 'MIT'
  # @todo Expand on this description eventually.
  s.description = <<-EOF
    Some simple but handy methods to interact with string objects.
  EOF
  s.email = 'elifosterwy@gmail.com'
  s.homepage = 'https://github.com/elifoster/string-utility-ruby'
  s.metadata = {
    'issue_tracker' => 'https://github.com/elifoster/string-utility-ruby/issues'
  }
  s.required_ruby_version = '>= 2.1'
  s.files = [
    'lib/string_utility.rb',
    'lib/string-utility.rb',
    'CHANGELOG.md',
    'LICENSE.md',
  ]
end
