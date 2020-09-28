# 4.8.3 添字を0以外の数値から開始させる
fruits = ['apple', 'orange', 'melon']
# eachで繰り返しつつ1から始まる添字を取得
fruits.each.with_index(1){ |fruit, i| puts "#{i}: #{fruit}" }

# 4.8.4 配列がブロック引数に渡される場合
dimensions = [
  # [縦, 横]
  [10, 20],
  [30, 40],
  [50, 60]
]
# 面積の計算結果を入れる
areas = []
# ブロック引数が1個であれば、ブロック引数の値が配列になる
dimensions.each do |dimension|
  length = dimension[0]
  width = dimension[1]
  areas << length * width
end
p areas #=> [200, 1200, 3000]

# ブロック引数を複数（配列の要素分だけ）用意すると、各要素の値が別々に変数に格納される
# 元の配列より多く指定した場合はnilになる
areas = []
dimensions.each do |length, width|
  areas << length * width
end
p areas #=> [200, 1200, 3000]

# each_with_index もとから2つの引数を取る場合、受け取るブロック引数を()で囲むと配列を別々の引数として受け取れる
dimensions.each_with_index do |(length, width), i|
  puts "length: #{length}, width: #{width}, i: #{i}"
end

# 4.8.5
# ブロックローカル変数
numbers = [1,2,3,4]
sum = 0
## ブロックの外にあるsumとは別のsumを用意
numbers.each do |n; sum|
  sum = 10
  sum += n
  p sum #> 11,12,13,14
end
## ブロックの外にあるsumには影響なし
p sum #> 0


