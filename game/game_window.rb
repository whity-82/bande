#coding:utf-8
require File.dirname(__FILE__) + "/require.rb"

# the logger
$log = nil

class GameWindow < Chingu::Window

  def initialize

    if $log.nil?
      $log = Logger.new(LOG_FILE)
      $log.level = (DEBUG_MODE) ? Logger::DEBUG : Logger::ERROR
    end

    font_filename = File.dirname(__FILE__) + "/fonts/" + FONT_NAME + ".ttf"
    if File.exists? font_filename
      $log.debug "font file exists"
      Chingu::Text.font = font_filename
    else
      $log.debug "font file not used"
      Chingu::Text.font = FONT_NAME
    end

    Chingu::Text.size = FONT_SIZE

    super(WINDOW_WIDTH, WINDOW_HEIGHT, false)
    self.caption = "Bande"
  end

  def setup
    switch_game_state(StateMenu)
  end

end
