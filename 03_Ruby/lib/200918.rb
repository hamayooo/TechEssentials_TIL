# 4.4 ブロックを使う配列のメソッド
# map/collect
# select/find_all/reject
# find/detect
# inject/reduce

# eachの次に使用頻度が高いメソッドはmap(エイリアスメソッドはcollect)
# 通常
numbers = [1,2,3,4,5]
new_numbers = []
numbers.each { |n| new_numbers << n *10 }
p new_numbers

# map
numbers = [1,2,3,4,5]
new_numbers = numbers.map { |n| n *10 }
p new_numbers

# select/find_all/reject
# select(エイリアスメソッドはfind_all)
numbers = [1,2,3,4,5,6]
# ブロックの戻り値が真になった要素だけが集められる
even_numbers = numbers.select { |n| n.even? }
p even_numbers

# reject
numbers = [1,2,3,4,5,6]
# ブロックの戻り値が真になった要素を除外した配列を返す
# 3の倍数を除外（3の倍数以外を集める）
non_multiples_of_three = numbers.reject { |n| n % 3 == 0 }
p non_multiples_of_three


# find/detect
# ブロックの戻り値が真になった最初の要素を返す
numbers = [1,2,3,4,5,6]
even_number = numbers.find { |n| n.even?}
p even_number

# inject/reduce
# たたみ込み演算を行う
numbers = [1,2,3,4,5,6]
sum = numbers.inject(0) { |result, n| result + n}
p sum

# 初回のみresultにinjectメソッドの0が入る
# 2回目以降はブロックの戻り値がresultに入る
# ブロックの第二引数nには配列の各要素が入る
# 最後まで終わる戸ブロックの戻り値がinjectメソッドの戻り値になる
# ((((0+1)+2)+3)+4)を行ったことになる
day = ['Mon','Tue','Wed','Thu','Fri','Sat'].inject('Sun') { |result, s| result + s }
p day

# もっと完結に書く
# (&:メソッド名)
=begin 
条件
1. ブロック引数が1個だけ
2. ブロックの中で呼び出すメソッドには引数がない
3. ブロックの中ではブロック引数に対してメソッドを1回呼び出す以外の処理がない
=end

lang_a = ['ruby', 'java', 'perl'].map { |s| s.upcase }
lang_b = ['ruby', 'java', 'perl'].map(&:upcase)
p lang_a
p lang_b

odd_a = [1,2,3,4,5,6].select { |n| n.odd? }
odd_b = [1,2,3,4,5,6].select(&:odd?)
p odd_a
p odd_b

=begin
これは使えない
- ブロックの中でメソッドではなく演算子を使ってる
- ブロックの中でメソッドで引数を渡してる
- ブロックの中で複数の文を実行してる
=end
[1,2,3,4,5,6].select { |n| n % 3 == 0 }
[1,2,3,4,5,6].map { |n| n.to_s(16) }
[1,2,3,4,5,6].map do |n|
  m = n *4
  m.to_s
end
