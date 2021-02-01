# 4.7.14 ミュータブル? イミュータブル?
=begin
--------------------------
ミュータブル(mutable) 変更可能な(オブジェクト)
イミュータブル(immutable) 変更できない、不変の(オブジェクト)

mutable 破壊的変更が過適用可能
ブロックを使用せずに初期値を指定すると不具合
- String

immutable 破壊的な変更が適用不可
- 数値(Integer、Float など)
- Symbol
- TrueClass、FalseClass
- NilClass

ミュータブルなオブジェクトはfreezeメソッドを使って変更不可にすることもできる！
--------------------------
=end

# コラム 文字列も配列と同じ様に操作できるよ
a = 'abcde'
p a[2]
p a[1, 3]
p a[-1]

a[0] ='X'
p a
a[1, 3] = 'Y'
p a
p a << 'PQR'

# 4.8 ブロックについてもっと詳しく

# 4.8.1 添え字付きの繰り返し処理
# each_with_indexメソッド
fruits = ['apple', 'orange', 'melon']
fruits.each_with_index { | fruit, i| puts "#{i}: #{fruit}"}
#=> 0: apple
#=> 1: orange
#=> 2: melon

# 4.8.2
# with_indexメソッド
fruits = ['apple', 'orange', 'melon']
# mapとして処理しつつ添え字も受け取る
p fruits.map.with_index { |fruit, i| "#{i}: #{fruit}" }
#=> ["0: apple", "1: orange", "2: melon"]

# map以外とも組み合わせることができる
# 名前にaを含みかつ添え字が奇数である要素を削除
p fruits.delete_if.with_index { |fruit, i| fruit.include?('a') && i.odd? }

# with_indexメソッドはEnumeratorクラスのインスタンスメソッド
# ブロックなしでメソッドを呼ぶとEnumeratorオブジェクトが帰る。よってwith_indexメソッドが呼び出せる

