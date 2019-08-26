
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

%w(rubygems colored).each do |gem|
  begin
    require gem
  rescue LoadError
    puts "failed to load #{gem}"
  end
end

%w(lib .local/ruby/lib $HOME/.irb).each do |lib|
  $LOAD_PATH << lib
end

if RUBY_PLATFORM =~ /darwin/
  def copy(str)
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end

  def paste
    `pbpaste`
  end
end

load File.dirname(__FILE__) + '/.railsrc' if $PROGRAM_NAME == 'irb' && ENV['RAILS_ENV']

def random_str(size = 8, avoid_ambiguous = false, use_punc = true)
  chars = (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a)
  chars -= %w(0 o O 1 l I) if avoid_ambiguous
  chars += %w(! % ^ & * @ $ # ; : . , ? ~) if use_punc
  (1..size).collect { || chars[rand(chars.size)] }.join
end
