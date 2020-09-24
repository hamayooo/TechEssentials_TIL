#4.5.4
#範囲オブジェクトに対してto_aメソッドを呼び出すと配列を作れる
range_array = (1..5).to_a
p range_array
p range_array[0] #=> ちゃんと抜き出せる

p ('a'..'e').to_a
p ('a'...'e').to_a
p ('bad'..'bag').to_a
p ('bad'...'bag').to_a

# splat展開:[* ] *を使って複数の値を配列に展開すること
p [*1..5]
p [*1...5]

