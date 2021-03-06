TestGame::Application.screen_manager.define_screen(:main_menu) do
  transition(:out) do |args|
    animate(:transparency).from(1).to(0)
                          .over(0.1)
                          .on_tick { |new_value| args[:to].transparency = 1 - new_value}
                          .on_complete(&args[:callback])
  end

  camera(:fixed)

  text('Eddy Example', :font => './assets/fonts/ObelixPro.ttf', 
       :font_size => 42, :flag => :cartoon, :position => Vec2.new(0, 120), :centered => :horizontal)

  button('start_button', :position => Vec2.new(0, 300), :centered => :horizontal) do
    TestGame::Application.screen_manager.transition_to(:game)
  end
end
