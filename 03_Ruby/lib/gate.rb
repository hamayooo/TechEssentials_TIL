# 機能
# テストシナリオを作る。結構難しそうな気がする…
=begin
1区間
2区間運賃不足
2区間運賃ちょうど
梅田以外の駅から乗車
=end

# プログラムの設計をする　※この辺苦手だから丁寧に…
=begin
・Gateクラスのenterメソッドは、引数として渡された切符（Ticket）に自分の駅名を保存する
・Ticketクラスにstampというメソッドを用意する。このメソッドに駅名を渡すとその駅名がTicketクラスのインスタンスに保持される
・乗車駅を取得する場合はTicketクラスのstamped_atメソッドを使う
・Gateクラスのexitメソッドは引数として渡された切符（Ticket）から運賃(fare)と乗車駅を取得する
・exitメソッドではさらに乗車駅と自分の駅名から運賃を割り出す。運賃がたりていればtrueを、そうでなければfalseを返す
=end

# このあとシーケンス図（クラスやオブジェクト間のやりとりを時間軸に沿って表現する図）

class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [150, 190]

  def initialize(name)
    @name = name
  end

  def enter(ticket)
    ticket.stamp(@name)
  end

  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end
end
