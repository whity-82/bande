#coding:utf-8
class StateMenu < Chingu::GameState

  def initialize
    super

    # メニューの設定
    @menus = [
      { "text" => "ダンジョンに潜る", "state" => :StateDungeon},
      { "text" => "宿屋に泊まる", "state" => :StateCharacter},
      { "text" => "商店に行く", "state" => :StateShop},
      { "text" => "お城に行く", "state" => :StateCastle},
      { "text" => "街はずれに行く", "state" => :StateMake}
    ]

    # テキストの設定
    @title = Chingu::Text.create(:x=>10, :y=>0, :size => FONT_SIZE, :zorder => ZOrder::Background, :color => Gosu::Color::RED)
    @title.text = <<EOS
===============================================
  Bande (the *Band Essential)       2013.04.26
===============================================
EOS

    @menu_texts = Array.new
    @menus.size.times do |i|
      @menu_texts[i] = Chingu::Text.create(
        :text => i.to_s + ". " + @menus[i]["text"],
        :x => 30,
        :y => FONT_SIZE * (@title.text.count("¥n") + i),
        :zorder => ZOrder::Front,
        :size => FONT_SIZE,
        :color => Gosu::Color::WHITE
      )
    end

    # 選択中メニュー
    @menu_id = 0

  end

  def setup
    super
    # キー入力イベントの定義
    self.input = {
      :escape => :close_game,
      :up => :menu_up,
      :down => :menu_down,
      :return => :select_menu
    }
  end

  def update
    super
  end

  def draw
    # メニュー描画
    @menu_texts.each_index do |i|
      @menu_texts[i].color = (@menu_id == i) ? Gosu::Color::CYAN : Gosu::Color::WHITE
      @menu_texts[i].draw
    end

    super
  end

  # メニューを上へ
  def menu_up
    menu_move(-1)
  end

  # メニューを下へ
  def menu_down
    menu_move(+1)
  end

  # メニュー移動
  def menu_move(direction)
    @menu_id += direction

    @menu_id = 0 if @menu_id < 0
    @menu_id = (@menus.size - 1) if (@menu_id > (@menus.size - 1))

  end

  # メニュー決定
  def select_menu
    push_game_state(Kernel.const_get(@menus[@menu_id]["state"]))
  end
end
