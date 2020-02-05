Gem::Specification.new do |spec|
  spec.name          = 'simple_ext'
  spec.version       = File.read(File.expand_path('../VERSION', __FILE__)).strip
  spec.summary       = 'Simple Ruby Extentions'
  spec.description   = 'Core ruby extentions extracted from Rails ActiveSupport'
  spec.author        = 'Tushar Hawaldar'
  spec.homepage      = 'https://github.com/kumartushar/simple_ext.git'
  spec.license       = 'MIT'
  spec.email         = ['kumartushar1111@gmail.com']
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.0'
  spec.files         = Dir['lib/**/*.rb']
end
