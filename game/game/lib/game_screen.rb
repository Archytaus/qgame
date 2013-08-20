QGame::Screen.new(:game) do
  button('pause_icon', :position => Vec2.new(128, 64), :mode => :on_press) do
    QGame::ScreenManager.current.pause
    QGame::ScreenManager.current.overlay(:pause_screen)
  end

  player = TestGame::Player.new(:position => Vec2.new(50, 300))

  dynamic_text(:frequency => 0.1, :position => Vec2.new(20), :font_size => 16) do
    "Score: #{player.score}"
  end

  level_generator = TestGame::LevelGenerator.new(player)
  add(level_generator)
  
  handle_events player
  add(player)

  test = TestGame::Test.new(:position => Vec2.new(100, 300))
  add(test)

  camera(:follow, :target => player)
  overlay(:virtual_gamepad) if QGame::Input.input_type_active? :virtual_gamepad
end
