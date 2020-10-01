# 4.9 さまざまな繰り返し処理
# 4.9.1 timesメソッド
sum = 0
# 5回繰り返す
5.times { |n| sum += n }
p sum #=> 10

#4.9.2 uptoメソッド / downtoメソッド
a = []
-1.upto(14) { |n| a << n }
p a #=> [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

a = []
9.downto(-4) { |n| a << n }
p a #=> [9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2, -3, -4]

# 4.9.3 stepメソッド
a = []
# 1から10まで2つずつ
1.step(10, 2) { |n| a << n }
p a #=> [1, 3, 5, 7, 9]

a = []
# 10から1まで-2つずつ
10.step(1, -2) { |n| a << n }
p a #=> [10, 8, 6, 4, 2]

# 4.9.4 whileとuntil
## while 条件式（真であれば実行）
##   繰り返したい処理
## end
a = []
while a.size < 5
  a << 1
end
p a #=> [1, 1, 1, 1, 1]

a = []
# do を入れると1行で
while a.size < 5 do a << 1 end
p a #=> [1, 1, 1, 1, 1]

a = []
# 修飾子としてwhileを後ろに置くほうがきれい
a << 1 while a.size < 5
p a #=> [1, 1, 1, 1, 1]

a = []
while false #=> 偽になるので実行されない
  a << 1
end
p a #=> []

begin #=> begin...end で囲むとどんな条件でも最低1回は実行される
  a << 1
end while false
p a #=> [1]

## untile 条件式（偽であれば実行）
##   繰り返したい処理
## end

a = [10,20,30,40,50]
until a.size <= 3
  a.delete_at(-1)
end
p a #=> [10, 20, 30]

# 4.9.5 for文
## for 変数 in 配列やハッシュ（eachメソッドを定義しているオブジェクトであれば何でもOK）
##   繰り返し処理
## end

numbers = [1,2,3,4]
sum = 0
for n in numbers
  sum += n
end
p sum #=> 10

sum = 0
for n in numbers do sum += n end
p sum #=> 10

numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum += n
end
p sum #=> 10

numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end
p n #=> NameError
# p sum_value #=> NameError

sum = 0
for n in numbers
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end
p n #=> 4
p sum_value #=> 40

# 4.9.6 loopメソッド
# while true
#   #無限ループ用の処理
# end

# loop do
#   # 無限ループ用の処理
# end

numbers = [1,2,3,4,5]
loop do
  # sample メソッドでランダムに要素を1つ取得する
  n = numbers.sample
  puts n
  break if n == 5
end

#whileで書く
while true
  n = numbers.sample
  puts n
  break if n == 5
end