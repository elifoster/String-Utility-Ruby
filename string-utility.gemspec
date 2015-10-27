Gem::Specification.new do |s|
  s.authors = ['Eli Foster']
  s.name = 'string-utility'
  s.summary = 'Provides some basic utilities for interacting with Strings'
  s.version = '2.5.1'
  s.license = 'CC-BY-NC-ND-4.0'
  # Expand on this description eventually.
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
    'lib/utils.rb',
    'lib/string-utility.rb',
    'CHANGELOG.md'
  ]
end
