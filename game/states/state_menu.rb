#coding:utf-8
require "./game/require.rb"

class StateMenu < Chingu::GameState

  def setup
    super

    # メニューの設定
    @menus = [
      { "text" => "ダンジョンに潜る", "state" => :state_dungeon},
      { "text" => "宿屋に泊まる", "state" => :state_inn},
      { "text" => "商店に行く", "state" => :state_shop},
      { "text" => "お城に行く", "state" => :state_castle},
      { "text" => "街はずれに行く", "state" => :state_make}
    ]

    # テキストの設定
    @title = Chingu::Text.create(:text=>"Bande", :x=>10, :y=>0, :size=>(FONT_SIZE * 1.5).to_i, :color => Gosu::Color::RED)

    @menu_texts = Array.new
    @menus.size.times do |i|
      @menu_texts[i] = Chingu::Text.create(
        :text=> i.to_s + ". " + @menus[i]["text"],
        :x=>30,
        :y=> (FONT_SIZE * (2 + i)).to_i,
        :size=>FONT_SIZE,
        :color => Gosu::Color::WHITE
      )
    end

    # 選択中メニュー
    @menu_id = 0

    # キー入力イベントの定義
    self.input = {
    :escape => :close_game,
    :up => :menu_up,
    :down => :menu_down
    }
  end

  def update
    super
  end

  def draw
    # タイトル描画
    @title.draw

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
end
