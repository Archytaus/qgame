QGame.each_target do
  current_dir = File.dirname(__FILE__)
  relative_from_root = File.dirname(__FILE__).relative_path_from(QGAME_ROOT)
  current_build_dir = "#{build_dir}/#{relative_from_root}"

  objs = Dir.glob("#{current_dir}/**/*.c").map { |f| objfile(f.pathmap("#{current_build_dir}/#{File.dirname(f).relative_path_from(current_dir)}/%n")) }

  self.libqgame << objs
  
  file libfile("#{build_dir}/lib/libqgame_core") => objs do |t|
    archiver.run t.name, t.prerequisites
  end
end
