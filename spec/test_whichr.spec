require File.dirname(__FILE__) + '/../lib/whichr'

require 'fileutils'

describe RubyWhich do

  it "should have working __DIR__" do
    __DIR__.should_not == nil
  end

  def setup
    ENV['PATH'] = 'test'
    FileUtils.rm_rf 'test'
    Dir.mkdir 'test'
    @a = RubyWhich.new
    FileUtils.touch 'test/abc.bat'

  end

  it "should not show non execs" do
    setup
    FileUtils.rm 'test/abc.bat' # clean it up
    FileUtils.touch 'test/abc'
    File.chmod 0777, 'test/abc'
    outs = @a.which('abc')
    assert outs.length == 0
    FileUtils.touch 'test/abc.bat'
    outs = @a.which('abc')
    assert outs.length == 1
  end

  it "should show non execs if you want it to" do
    setup
    FileUtils.rm 'test/abc.bat' # clean it up
    FileUtils.touch 'test/abc'
    File.chmod 0777, 'test/abc'
    outs = @a.which('abc', true)
    assert outs.length == 1

  end

  it "should only give uniq k?" do
    setup
    ENV['PATH'] = 'test' + File::PATH_SEPARATOR + 'test'
    FileUtils.touch 'test/abc.bat'
    outs = @a.which('abc')
    assert outs.length == 1
  end

  it "should give you cwd if on doze" do
    setup
    Dir.chdir 'test' do
      outs = @a.which('abc')
      if RUBY_PLATFORM =~ /mingw|mswin/
        assert outs.length == 1
      else
        # LTODO
        assert outs.length == 0
      end
      
    end

  end

  it "should not be ugly" do
    setup
    outs = @a.which('abc')
    assert !outs[0].include?('abc.BAT') 
  end
end
