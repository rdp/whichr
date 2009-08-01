Gem::Specification.new do |s|
  s.name = %q{which_ruby}
  s.version = "0.0.4"
 
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roger Pack"]
  s.description = s.summary = %q{windows friendly which command}
  s.email = ["rogerdpack@gmail.comm"]
  s.files = ["bin/which_ruby"]
  s.homepage = %q{http://github.com/rogerdpack/which_ruby}
  s.executable = 'which_ruby'

  s.add_dependency(%q<rdoc>, [">= 2.3.0"]) # so that I don't need a lib directory :P
  s.add_dependency(%q<rogerdpack-sane>) # Object.in?
     
end

