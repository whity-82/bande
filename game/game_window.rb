#coding:utf-8
require File.dirname(__FILE__) + "/require.rb"

# the logger
$log = nil

class GameWindow < Chingu::Window

  def initialize
    super(WINDOW_WIDTH, WINDOW_HEIGHT, false)
    self.caption = "Bande"

    if $log.nil?
      $log = Logger.new(LOG_FILE)
      $log.level = (DEBUG_MODE) ? Logger::DEBUG : Logger::ERROR
    end

  end

  def setup
    switch_game_state(StateMenu)
  end

end
