Gem::Specification.new do |s|
  s.name         = 'studio_game'
  s.version      = '1.0.0'
  s.author       = 'Eleni Lixourioti'
  s.email        = 'contact@eleni.co'
  s.homepage     = 'https://github.com/Geekfish/studio-game'
  s.summary      = 'Simple game following the Pragmatic Studio ruby course'
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.licenses     = ['MIT']

  s.files         = Dir['{bin,lib,spec}/**/*'] + %w[LICENSE README.md]
  s.test_files    = Dir['spec/**/*']
  s.executables   = ['studio_game']

  s.required_ruby_version = '>=3.0'
  s.add_development_dependency 'rspec', '~> 3.10', '>= 3.10.0'
end
