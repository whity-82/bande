#coding:utf-8
require "./game/require.rb"

class StateCastle < Chingu::GameState
  def setup
    super

    $log.error "未実装クラス:" + self.class.name

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