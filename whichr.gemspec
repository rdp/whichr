Gem::Specification.new do |s|
  s.name = %q{whichr}
  s.version = "0.1.6"
 
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roger Pack"]
  s.description = s.summary = %q{windows friendly which command}
  s.email = ["rogerdpack@gmail.comm"]
  s.files = ["bin/whichr", "lib/whichr.rb", "README"]
  s.homepage = %q{http://github.com/rogerdpack/which_ruby}
  s.executable = 'whichr'
  s.require_paths = ["lib"]
  s.add_dependency(%q<rdoc>, [">= 2.3.0"]) # so that I don't need a lib directory :P
  s.add_dependency(%q<rogerdpack-sane>) # Object.in?
     
end

# 0.1.0 initial release happy birthday
# 0.1.1 bump README
# 0.1.2 respect ENV['PATHEXT'] and '.' on windows
# 0.1.3 use the right capitalization in doze
# 0.1.4 split into a re-usable lib
# 0.1.5 allow pass in single string
# 0.1.6 output message on startup