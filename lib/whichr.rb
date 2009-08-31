# stolen from the gnuplot gem
# and then modified
require 'rubygems'
require 'sane'

class RubyWhich
  # search the path for the given names
  # like ['abc'] (in windows, also searches for abc.bat)
  # or ['ab*'] (a glob, in windows, also reveals ab*.bat)
  def which( names )
    names = [names] unless names.is_a? Array

    if RUBY_PLATFORM =~ /mswin|mingw/
      for name in names.dup # avoid recursion
        # windows compat.
        for extension in  ENV['PATHEXT'].split(';') do
          names << name + extension
        end
      end
    end

    all_found = []
    path = ENV['PATH']
    # on windows add . [the cwd]
    path += ('.' + File::PATH_SEPARATOR) if RUBY_PLATFORM =~ /mswin|mingw/

    path.split(File::PATH_SEPARATOR).each do |dir|
      for name in names
        all_found += Dir.glob(dir.gsub("\\", "/") + '/' + name.strip)
      end
    end

    all_found
  end

end
