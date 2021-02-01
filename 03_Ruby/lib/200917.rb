# 配列や繰り返し
# 配列、ブロック、範囲（Range）、繰り返し処理、繰り返し処理用の制御構造

# 配列いろいろ
p [].class
p a = [1,2,3,[10,20,[4,5,6],30],7,8]
p a[0]
p a[4]
p a.size
p a.length

a[6] = 100
p a

# 最後に要素を追加
a = []
a << 1
a << 2
a << 3
p a

# 削除した値が戻り値
a.delete_at(1)
p a

# 多重代入
a, b = 1, 2
p a
p b

# 配列を使って多重代入
a, b = [1, 2]
p a
p b

c, d = [10]
p c
p d

e, f = [100,200,300]
p e
p f

# 割り算の商と余りを配列として返す
p 14.divmod(3)

# 戻り値を配列のまま受け取る
quo_rem = 14.divmod(3)
  puts "商=#{quo_rem[0]}, 余り=#{quo_rem[1]}"

# 多重代入で別々の変数として受け取る
quotient, remaindar = 14.divmod(3)
  puts "商=#{quotient}, 余り=#{remaindar}"

# ブロック
# メソッドの引数として渡すことができる処理のかたまり

# Rubyの繰り返し処理
# for などは使わず配列自身に対して繰り返せという命令を送る => each
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n| # |n|から
  sum += n
end # end までがブロック
p sum

# delete_if 配列の要素を順番に取り出す。ブロックの戻り地が真であれば要素を削除する。
numbers.delete_if do |n| # delete(2)もOK。同じ値じゃないと削除できない
  n.even?
end
p numbers

# n じゃなくてもいい
# |num|, |i|, |element| なんでもいい
# ブロック内部にはrubyで自由にかける
numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n # nが偶数だったら10倍
  sum += sum_value # 加算する
end
p sum

# ブロック内部で使用した変数は、ブロック外では使えない
# ブロック外部で使用した変数は、ブロック内でも使える

# 4.3.5 do ... end と{}
numbers = [1,2,3,4]
sum = 0
# ブロック改行無しで
# numbers.each do |n| sum += n end

# do end の代わりに{}で囲む
numbers.each { |n| sum += n }
p sum