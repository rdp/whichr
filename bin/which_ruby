# stolen from the gnuplot gem
# and then modified
  puts 'syntax: binary_name'
  return unless ARGV[0]
  def which ( bin )
    success = false
    path = '.' + File::PATH_SEPARATOR + ENV['PATH']

    path.split(File::PATH_SEPARATOR).each do |dir|
      candidates = Dir.glob (dir.gsub("\\", "/") + '/' + bin.strip)
      for candidate in candidates
      if File::executable? candidate
         puts candidate
         success = true
      elsif File::exist? candidate
        puts candidate + ' is not executable'
      end
      end
    end

    # This is an implementation that works when the which command is
    # available.
    # 
    # IO.popen("which #{bin}") { |io| return io.readline.chomp }

    return success
  end 
  answer = which(ARGV[0])
  # windows compat.
  if !answer and RUBY_PLATFORM =~ /mswin|mingw/
    which(ARGV[0] + '.exe')
    which(ARGV[0] + '.bat')
    which(ARGV[0] + '.cmd')
  end
