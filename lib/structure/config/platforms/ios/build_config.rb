Game::Build.new do |conf|
  toolchain :clang
  
  conf.cc do |cc|
    cc.include_paths = ["#{QGAME_ROOT}/include", "#{MRUBY_ROOT}/include"]
    cc.include_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/include"
  end

  # Linker settings
  conf.linker do |linker|
    linker.libraries = %w(qgame mruby SDL2_image SDL2_mixer SDL2 GL freetype)
    linker.library_paths = ["#{QGAME_ROOT}/build/#{conf.name}/lib", "#{MRUBY_ROOT}/build/#{conf.name}/lib"]
    linker.library_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/lib"
    linker.library_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/lib"
    linker.library_paths << "/System/Library/Frameworks/OpenGL.framework/Libraries"
  end
end

Game::BuildiOS.new('ios_i386') do |conf|
  toolchain :ios_i386
  
  conf.bins = %w(GameTest.app)
  conf.cc do |cc|
    cc.include_paths = ["#{QGAME_ROOT}/include", "#{MRUBY_ROOT}/include"]
    cc.include_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/include"
  end

  # Linker settings
  conf.linker do |linker|
    linker.libraries = %w(qgame mruby SDL2_image SDL2_mixer SDL2 GL freetype)
    linker.library_paths = ["#{QGAME_ROOT}/build/#{conf.name}/lib", "#{MRUBY_ROOT}/build/#{conf.name}/lib"]
    linker.library_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/lib"
    linker.library_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/lib"
    linker.library_paths << "/System/Library/Frameworks/OpenGL.framework/Libraries"
  end
end

Game::BuildiOS.new('ios_arm') do |conf|
  toolchain :ios_arm
  
  conf.bins = %w(GameTest.app)
  conf.cc do |cc|
    cc.include_paths = ["#{QGAME_ROOT}/include", "#{MRUBY_ROOT}/include"]
    cc.include_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/include"
  end

  # Linker settings
  conf.linker do |linker|
    linker.libraries = %w(qgame mruby SDL2_image SDL2_mixer SDL2 GL freetype)
    linker.library_paths = ["#{QGAME_ROOT}/build/#{conf.name}/lib", "#{MRUBY_ROOT}/build/#{conf.name}/lib"]
    linker.library_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/lib"
    linker.library_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/lib"
    linker.library_paths << "/System/Library/Frameworks/OpenGL.framework/Libraries"
  end
end

QGame::Build.new do |conf|
  toolchain :clang

  gem_include_paths = Dir.glob("build/mrbgems/**/include")

  conf.cc do |cc|
    cc.include_paths = ["#{QGAME_ROOT}/include", "#{MRUBY_ROOT}/include"]
    cc.include_paths.concat gem_include_paths
    cc.include_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/include"
    cc.include_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/include"
    cc.include_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/include/freetype2"
  end

  # Linker settings
  conf.linker do |linker|
    linker.libraries = %w(libmruby freetype)
    linker.library_paths = ["#{MRUBY_ROOT}/build/#{conf.name}/lib"]
    linker.library_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/lib"
    linker.flags << "-framework OpenGLES"
  end
end

QGame::BuildiOS.new('ios_i386') do |conf|
  toolchain :ios_i386

  gem_include_paths = Dir.glob("build/mrbgems/**/include")

  conf.cc do |cc|
    cc.include_paths = ["#{QGAME_ROOT}/include", "#{MRUBY_ROOT}/include"]
    cc.include_paths.concat gem_include_paths
    cc.include_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/include"
    cc.include_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/include"
    cc.include_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/include/freetype2"
  end

  # Linker settings
  conf.linker do |linker|
    linker.libraries = %w(libmruby freetype)
    linker.library_paths = ["#{MRUBY_ROOT}/build/#{conf.name}/lib"]
    linker.library_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/lib"
    linker.flags << "-framework OpenGLES"
  end
end

QGame::BuildiOS.new('ios_arm') do |conf|
  toolchain :ios_arm

  gem_include_paths = Dir.glob("build/mrbgems/**/include")

  conf.cc do |cc|
    cc.include_paths = ["#{QGAME_ROOT}/include", "#{MRUBY_ROOT}/include"]
    cc.include_paths.concat gem_include_paths
    cc.include_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/include"
    cc.include_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/include"
    cc.include_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/include/freetype2"
  end

  # Linker settings
  conf.linker do |linker|
    linker.libraries = %w(libmruby freetype)
    linker.library_paths = ["#{MRUBY_ROOT}/build/#{conf.name}/lib"]
    linker.library_paths << "#{QGAME_ROOT}/dependencies/freetype/#{conf.name}/lib"
    linker.flags << "-framework OpenGLES"
  end
end

MRuby::Build.new do |conf|
  toolchain :clang

  conf.gembox 'default'
end

MRuby::CrossBuildiOS.new('ios_i386') do |conf|
  toolchain :ios_i386
  
  conf.cc do |cc|
    cc.include_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/include"
  end

  conf.linker do |linker|
    linker.libraries = %w(SDL2_image SDL2_mixer SDL2 GL)
    linker.library_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/lib"
  end

  # Use standard Kernel#sprintf method
  conf.gem :core => "mruby-sprintf"

  # Use standard print/puts/p
  conf.gem :core => "mruby-print"

  # Use standard Math module
  conf.gem :core => "mruby-math"

  # Use standard Time class
  conf.gem :core => "mruby-time"

  # Use standard Struct class
  conf.gem :core => "mruby-struct"

  # Use extensional Enumerable module
  conf.gem :core => "mruby-enum-ext"

  # Use extensional String class
  conf.gem :core => "mruby-string-ext"

  # Use extensional Numeric class
  conf.gem :core => "mruby-numeric-ext"

  # Use extensional Array class
  conf.gem :core => "mruby-array-ext"

  # Use extensional Hash class
  conf.gem :core => "mruby-hash-ext"

  # Use extensional Range class
  conf.gem :core => "mruby-range-ext"

  # Use extensional Proc class
  conf.gem :core => "mruby-proc-ext"

  # Use extensional Symbol class
  conf.gem :core => "mruby-symbol-ext"

  # Use Random class
  conf.gem :core => "mruby-random"

  # Use ObjectSpace class
  conf.gem :core => "mruby-objectspace"

  # Use extensional Object class
  conf.gem :core => "mruby-object-ext"

  # Use Fiber class
  conf.gem :core => "mruby-fiber"
end

MRuby::CrossBuildiOS.new('ios_arm') do |conf|
  toolchain :ios_arm
  
  conf.cc do |cc|
    cc.include_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/include"
  end

  conf.linker do |linker|
    linker.libraries = %w(SDL2_image SDL2_mixer SDL2 GL)
    linker.library_paths << "#{QGAME_ROOT}/dependencies/SDL2/#{conf.name}/lib"
  end

  # Use standard Kernel#sprintf method
  conf.gem :core => "mruby-sprintf"

  # Use standard print/puts/p
  conf.gem :core => "mruby-print"

  # Use standard Math module
  conf.gem :core => "mruby-math"

  # Use standard Time class
  conf.gem :core => "mruby-time"

  # Use standard Struct class
  conf.gem :core => "mruby-struct"

  # Use extensional Enumerable module
  conf.gem :core => "mruby-enum-ext"

  # Use extensional String class
  conf.gem :core => "mruby-string-ext"

  # Use extensional Numeric class
  conf.gem :core => "mruby-numeric-ext"

  # Use extensional Array class
  conf.gem :core => "mruby-array-ext"

  # Use extensional Hash class
  conf.gem :core => "mruby-hash-ext"

  # Use extensional Range class
  conf.gem :core => "mruby-range-ext"

  # Use extensional Proc class
  conf.gem :core => "mruby-proc-ext"

  # Use extensional Symbol class
  conf.gem :core => "mruby-symbol-ext"

  # Use Random class
  conf.gem :core => "mruby-random"

  # Use ObjectSpace class
  conf.gem :core => "mruby-objectspace"

  # Use extensional Object class
  conf.gem :core => "mruby-object-ext"

  # Use Fiber class
  conf.gem :core => "mruby-fiber"
end
