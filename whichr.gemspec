Gem::Specification.new do |s|
  s.name = %q{whichr}
  s.version = "0.1.2"
 
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roger Pack"]
  s.description = s.summary = %q{windows friendly which command}
  s.email = ["rogerdpack@gmail.comm"]
  s.files = ["bin/whichr", "README"]
  s.homepage = %q{http://github.com/rogerdpack/which_ruby}
  s.executable = 'whichr'

  s.add_dependency(%q<rdoc>, [">= 2.3.0"]) # so that I don't need a lib directory :P
  s.add_dependency(%q<rogerdpack-sane>) # Object.in?
     
end

# 0.1.0 initial release happy birthday
# 0.1.1 bump README
# 0.1.2 respect ENV['PATHEXT'] and '.' on windows
