#coding:utf-8
require "./game/require.rb"

class StateCharacter < Chingu::GameState

  def initialize
    super

    # テキストの設定
    @title = Chingu::Text.create(:text=>"ステータス画面", :x=>10, :y=>0, :size=>(FONT_SIZE * 1.5).to_i, :color => Gosu::Color::RED)

  end

  def setup
    super
    # キー入力イベントの定義
    self.input = {
      :escape => :pop_game_state
    }
  end

  def update
    super
  end

  def draw
    super
  end

end
