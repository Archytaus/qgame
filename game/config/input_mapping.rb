QGame::InputMapping.new(QGame::KeyboardInput) do
  map :a => :move_left
  map :left => :move_left

  map :d => :move_right
  map :right => :move_right

  map :space => :jump
end

QGame::InputMapping.new(QGame::GamepadInput) do
  map :left => :move_left
  map :right => :move_right

  map :a => :jump
end

QGame::InputMapping.new(QGame::VirtualGamepadInput) do
  map_like QGame::GamepadInput
end
