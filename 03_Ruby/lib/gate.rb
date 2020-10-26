# 機能
# テストシナリオを作る。結構難しそうな気がする…
=begin
1区間
2区間運賃不足
2区間運賃ちょうど
梅田以外の駅から乗車
=end

class Gate
  def initialize(name)
    @name = name
  end

  def enter(ticket)
  end

  def exit(ticket)
    true
  end
  
end
