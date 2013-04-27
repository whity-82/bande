#coding:utf-8
require "./game/require.rb"

class GameWindow < Chingu::Window

  def initialize
    super(WINDOW_WIDTH, WINDOW_HEIGHT, false)
    self.caption = "Bande"
  end

  def setup
    switch_game_state(StateMenu)
  end

end
