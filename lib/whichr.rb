# stolen from the gnuplot gem
# and then modified
require 'rubygems'
require 'sane'

class RubyWhich
  # search the path for the given names
  # like ['abc'] (in windows, also searches for abc.bat)
  # or ['ab*'] (a glob, in windows, also reveals ab*.bat)
  def which( names, return_non_executables_too = false )
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
    path += (File::PATH_SEPARATOR + '.') if RUBY_PLATFORM =~ /mswin|mingw/
    path.split(File::PATH_SEPARATOR).each do |dir|
      for name in names
        if RUBY_PLATFORM =~ /mswin|mingw/
    	  names2 = Dir.glob(dir.gsub("\\", "/") + '/' + name.strip)
    	  unless return_non_executables_too
    	    names2 = names2.select{|name| File.executable?(name)} # only real execs
    	  end
    	  names2.collect!{|name| File.expand_path(name)} # get the right capitalization
        else
    	  names2 = Dir.glob(dir + '/' + name.strip)
  	    end
        
        all_found += names2.collect{|name| File.expand_path(name)}
      end
    end

    # parse out same spelled fellas in doze
    if RUBY_PLATFORM =~ /mswin|mingw/
      unique = []
      previous = {}
      all_found.each {|entry|
        if previous[entry.downcase] 
          # do nothing
        else
           previous[entry.downcase] = 'ja'
           unique << entry
        end
      }
      all_found = unique
    else
      all_found.uniq!
    end
    all_found
  end

  def process(names, all = false)
    candidates = which(names, all)
    if candidates == []
    	puts 'none found (' + names.inspect + ')'
    else
    	print output(candidates)
    end
  end

  def output all
    output = "higher in the list is executed first\n"
    for candidate in all
      # might just match the name and not be executable
      candidate = Dir.glob(candidate + '*')[0] if RUBY_PLATFORM =~ /mswin|mingw/ # get the right capitalization in doze
      output << candidate
      if !File.executable? candidate
        output += ' (is not executable)'
        if(File.directory?(candidate))
          output << ' (is a directory)'
        end
      end
      output << "\n"
    end
    output
  end


end
