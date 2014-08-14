task :default => :activate

desc 'compile Comamnd-T'
task :compile_command_t do
  Dir.chdir(File.dirname(__FILE__) + "/vim/bundle/Command-T") do
    sh "rvm system do rake make"
  end
end

desc 'symlink files into home directory'
task :activate do
  working_dir = File.expand_path(File.dirname(__FILE__))
  home_dir = File.expand_path("~")
  dot_files = Dir.glob(File.join(working_dir,"*"))

  p dot_files
  dot_files.each do |filename|
    next if filename =~ /Rakefile|README.txt|Gemfile/
    sym_link = File.join(home_dir,".#{File.basename(filename)}")
    rm_rf(sym_link) if File.symlink?(sym_link) || File.exist?(sym_link)
    ln_s filename, sym_link
  end
  Rake::Task["update_vim"].execute
  Rake::Task["install_gems"].execute
end

desc 'updates vim plugins'
task :update_vim do
  sh "vim +PluginInstall +qall"
end

desc 'install global gems'
task :install_gems do
  sh "bundle install --system"
end
