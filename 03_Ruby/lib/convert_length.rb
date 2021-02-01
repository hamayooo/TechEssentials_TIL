# 長さの単位変換プログラム
## 流れの振り返り
# - メートル:m、フィート:ft、インチ:inの単位を相互に変換
# - 第１引数に変換元の長さ（数値）、第２引数に変換元の単位、第３引数に変換後の単位を指定する
# - メソッドの戻り値は変換後の長さ（数値）とする。端数が出る場合は少数第３位で四捨五入する

UNITS = { m: 1.0, ft: 3.28, in: 39.37} #=> 定数として外へ
# def convert_length(length, unit_from, unit_to)
def convert_length(length, from: :m, to: :m) #=> デフォルト値をm
  # units = { 'm' => 1.0, 'ft' => 3.28, 'in' => 39.37}
  # units = { m: 1.0, ft: 3.28, in: 39.37} #=> 定数として外へ
  # (length / units[unit_from] * units[unit_to]).round(2)
  # (length / units[from] * units[to]).round(2)
  (length / UNITS[from] * UNITS[to]).round(2)
  # round(2) => 四捨五入
end