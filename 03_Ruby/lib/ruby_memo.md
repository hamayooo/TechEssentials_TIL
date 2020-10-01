# ruby
## 数値の出力メソッド
```rb
1.to_s #文字列変換
10.to_s(2) #2進数の文字列変換
10.to_s(16) #16進数の文字列変換
1.to_f #1.0に小数変換
1.to_f / 2 #0.5
sprintf('%0.3f', 1.2) #1.200 小数点第3位
'%0.3f' % 1.2 #1.200 小数点第3位
sprintf('%0.3f + %0.3f', 1.2, 0.48) #1.200 + 0.480
'%0.3f + %0.3f' % [1.2, 0.48] #1.200 + 0.480
'2/3'.to_r #有理数に変換
0.1r * 0.3r #有理数 3/10 10分の3
0.1.relationalize * 0.3.relationalize # 3/10
1.to_i #整数に変換
2e-3 #2x10の-3乗
0.5i.to_c #複素数に変換

10.class #Integer 整数
1.5.class #Float 少数
3r.class #Retional 有理数
0.5i.class #Complex 複素数
```

## 条件演算子
```rb
n = 11
message = n > 10 ? '10より大きい' : '10以下' 
p message # 10より大きい
```

## メソッドの終わらせ方
- 変数名には!や?は使えない
```rb
# 真偽値を返す目的のときは？で終わらせる
'abc'.nil? #false
''.nil? #true
1.odd? #true
2.even? #true

# 破壊的メソッド !
a = 'ruby'
a.upcase! # RUBY
```

# 式と文
```
値を返し、変数に代入可能 = 式
値を返さず変数に代入するとエラー = 文
rubyでは文のように見えるが実は式、というものがおおい。戻り値を活用できる。
```

# 疑似関数
```rb
# nil,true,false も疑似変数
self # オブジェクト自身 # main
__FILE__ # 現在のソースファイル名 # ruby_memo.md
__LINE__ # 現在のソースファイルの行番号 # 59
__ENCODING__ # 現在のソースファイルのスクリプトエンコーディング # Encoding:UTF-8
```

# 参照
```
Rubyの変数にはオブジェクトへの参照が格納される
オブジェクトそのものではない
オブジェクトの状態が変わると、同じオブジェクトを参照している全ての変数に影響がある
```

# ライブラリ
```
標準ライブラリ
https://docs.ruby-lang.org/ja/latest/library/index.html

組み込みライブラリ
https://docs.ruby-lang.org/ja/latest/library/_builtin.html

外部ライブラリ:gem
別途インストールが必要
```

# require / load / require_relative
```rb
# 組み込みライブラリでない標準ライブラリやgemを利用する場合
# 1回しかライブラリやrbファイルを読み込まない
# 拡張子.rbなどを省略できる
require './sample'

# 毎回無条件に指定したファイルを読み込む
load './sample.rb'

# rubyの実行ディレクトリの影響を受けずにプログラムを読み込みたい場合
# 拡張子不要
require_relative './sample'
```

# puts / print / p
```
基本はputsを使うが、改行なしのprintを使う場面もある
```
 | メソッド | 出力後の改行 | 配列の表示 | 呼び出すメソッド | 戻り値 | 対象者 |
 | ---- | ---- | ---- | ---- | ---- | ---- |
 | puts | あり | 要素ごとに改行 | to_s | nil | 一般ユーザ |
 | print | なし | 改行しない | to_s | nil | 一般ユーザ |
 | p | あり | 改行しない | inspect | 引数のオブジェクト | 開発者 |

 # テストの自動化
 ```
 Minitestをgemからインストール
 $ gem install minitest -v version(5.14.2 latest)
```

```rb
# sample code
require 'minitest/autorun'

class SampleTest < Minitest::Test # 継承（あとで）
  def test_sample # Minitestはtest_で始まるメソッドを探す
    assert_equal 'RUBY', 'ruby'.upcase # 検証メソッド
  end
end

# aがbと等しければパスする
assert_equal b, a

# aが真であればパスする
assert a

# が偽であればパスする
refute a

# Finished in 0.000808s テスト実行にかかった時間
# 1237.6238 runs/s 1秒間に実行できるであろうテストメソッドの件数
# 1237.6238 assertions/s. 1秒間に実行できるであろう検証メソッドの件数
# 1 runs, 実行したテストメソッドの件数
# 1 assertions 実行した検証メソッドの件数
# 0 failures 検証に失敗したテストメソッドの件数
# 0 errors 検証中にエラーが発生したテストメソッドの件数
# 0 skips skipメソッドにより実行をスキップされたテストメソッドの件数

# failuresとerrorsがゼロならテスト成功

# 別ファイルから呼ぶ場合
recuire './lib/fizz_buzz' #-> ruby実行場所が起点
recuire_relative '../lib/fizz_buzz' #-> これを書いてるファイルが起点
```

# Minitest以外のテスティングフレームワーク
```rb
# RSpec
# 独自のDSL（ドメイン固有言語）をつかってテストコードを書く
# ドキュメント豊富、便利な機能たくさん
# 別途gemでインストールすべし
require './lib/fizz_buzz'

RSpec.describe 'Fizz Buzz' do
  example 'fizz_buzz' do
    expect(fizz_buzz(1)).to eq '1'
    expect(fizz_buzz(2)).to eq '2'
    expect(fizz_buzz(3)).to eq 'Fizz'
    #省略
  end
end

# test-unit
# Minitestはtest-unitと互換性のあるフレームワークを目指していたのでよく似てる
require 'test/unit'
require './lib/fizz_buzz'

class FizzBuzzTest < Test::Unit::TestCase
  def test_fizz_buzz
    assert_equal '1', fizz_buzz(1)
    assert_equal '2', fizz_buzz(2)
    assert_equal 'Fizz', fizz_buzz(3)
    #省略
  end
end
```

# 配列
```rb
# 最後に要素を追加
a = []
a << 1
a << 2
a << 3 #=> [1,2,3]

# 値の削除
a.delete_at(1) #=> [1,3]

# 多重代入
a, b = 1, 2 #=> a = 1 , b = 2

# 配列を使って多重代入
a, b = [1, 2] #=> a = 1 , b = 2

c, d = [10] #=> c = 10 , d = nil

e, f = [100,200,300] #=> e = 100, f = 200

# 割り算の商と余りを配列として返す
14.divmod(3) #=> [4, 2]

# 戻り値を配列のまま受け取る
quo_rem = 14.divmod(3)
  "商=#{quo_rem[0]}, 余り=#{quo_rem[1]}" #=> 商=4, 余り=2

# 多重代入で別々の変数として受け取る（こっちのほうがスッキリ）
quotient, remaindar = 14.divmod(3)
  "商=#{quotient}, 余り=#{remaindar}" #=> 商=4, 余り=2
```

# ブロック
```rb
# Rubyの繰り返し処理
# for などは使わず配列自身に対して繰り返せという命令を送る => each
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n| # |n|から
  sum += n
end # end までがブロック

# delete_if 配列の要素を順番に取り出す。ブロックの戻り地が真であれば要素を削除する。
# delete_ifメソッドの仕様に合わせてブロック内に処理を記述＋真偽の値を返す
numbers.delete_if do |n| # delete(2)もOK。同じ値じゃないと削除できない
  n.even?
end
```

<!-- rubyには「要件を問わず共通する処理」はメソッド自身に、「要件によって異なる処理」はブロックにそれぞれ分担させて、1つの処理を完了させるメソッドがたくさんある -->

```rb
# ブロック続き
# ブロック内部で使用した変数は、ブロック外では使えない
# ブロック外部で使用した変数は、ブロック内でも使える
numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n # nが偶数だったら10倍
  sum += sum_value # 加算する
end
sum_value #=> NameError

# do end の代わりに{}で囲む
numbers.each { |n| sum += n }
numbers.each { |n| # 改行もあり
  sum += n
}

# --------使いどころ--------
# 改行を伴う長いブロックは do ... end
# 1行でコンパクトに書きたいときは {}
```

## ブロックを使う配列のメソッド(4.4)
```rb
# each
numbers = [1,2,3,4,5]
new_numbers = []
numbers.each { |n| new_numbers << n *10 }

# map
# ブロックの戻り値が配列の要素となる新しい配列が作成されるため、mapメソッドの戻り値をそのまま新しい変数に入れることができる
numbers = [1,2,3,4,5]
new_numbers = numbers.map { |n| n *10 } #=> [10, 20, 30, 40, 50]

# select(エイリアスメソッドはfind_all)
numbers = [1,2,3,4,5,6]
# ブロックの戻り値が真になった要素だけが集められる
even_numbers = numbers.select { |n| n.even? } #=> [2, 4, 6]

# reject
numbers = [1,2,3,4,5,6]
# ブロックの戻り値が真になった要素を除外した配列を返す
# 3の倍数を除外（3の倍数以外を集める）
non_multiples_of_three = numbers.reject { |n| n % 3 == 0 }


# find/detect
# ブロックの戻り値が真になった最初の要素を返す
numbers = [1,2,3,4,5,6]
even_number = numbers.find { |n| n.even?}

# inject/reduce
# たたみ込み演算を行う
numbers = [1,2,3,4,5,6]
sum = numbers.inject(0) { |result, n| result + n}
=begin
初回のみresultにinjectメソッドの0が入る
2回目以降はブロックの戻り値がresultに入る
ブロックの第二引数nには配列の各要素が入る
最後まで終わる戸ブロックの戻り値がinjectメソッドの戻り値になる
((((0+1)+2)+3)+4)を行ったことになる
=end
day = ['Mon','Tue','Wed','Thu','Fri','Sat'].inject('Sun') { |result, s| result + s }
```

```rb
# 完結に書く
# (&:メソッド名)
# 条件
# 1. ブロック引数が1個だけ
# 2. ブロックの中で呼び出すメソッドには引数がない
# 3. ブロックの中ではブロック引数に対してメソッドを1回呼び出す以外の処理がない

lang_a = ['ruby', 'java', 'perl'].map { |s| s.upcase }
lang_b = ['ruby', 'java', 'perl'].map(&:upcase)

odd_a = [1,2,3,4,5,6].select { |n| n.odd? }
odd_b = [1,2,3,4,5,6].select(&:odd?)

# これは使えない
# - ブロックの中でメソッドではなく演算子を使ってる
# - ブロックの中でメソッドで引数を渡してる
# - ブロックの中で複数の文を実行してる

[1,2,3,4,5,6].select { |n| n % 3 == 0 }
[1,2,3,4,5,6].map { |n| n.to_s(16) }
[1,2,3,4,5,6].map do |n|
  m = n *4
  m.to_s
end
```

# Range：範囲オブジェクト
```rb
# 範囲オブジェクト
range = 1..5 # 最後の値を含む 1以上5以下
range = 1...5 # 最後の値を含まない  1以上5未満

# 配列や文字列の一部を抜き出す
a = [1,2,3,4,5]
a[1..4]
a[1...4]
b = 'abcdef'
b[0..2]
b[0...2]

# n以上m以下、n以上m未満の判定
##不等号を使う場合
def liquid?(temperature)
  # 0度以上100度未満であれば液体
  0 <= temperature && temperature < 100
end

## 範囲オブジェクトを使う場合
def liquid?(temperature)
  (0...100).include?(temperature)
end

# case文で使用する
def charge(age)
  case age
  #0歳から5歳までの場合
  when 0..5
    0
  #6歳から12歳までの場合
  when 6..12
    300
  #13歳から18歳までの場合
  when 13..18
    600
  #それ以外
  else
    1000
  end
end
charge(3) #=> 0
charge(12) #=> 300
charge(13) #=> 600
charge(25) #=> 1000

#範囲オブジェクトに対してto_aメソッドを呼び出すと配列を作れる
range_array = (1..5).to_a
p range_array
p range_array[0] #=> ちゃんと抜き出せる

('a'..'e').to_a
('a'...'e').to_a
('bad'..'bag').to_a
('bad'...'bag').to_a

# splat展開:[* ] *を使って複数の値を配列に展開すること
[*1..5]
[*1...5]
```

# RGB変換プログラムを作成
```
・10進数を16進数に変換するto_hexメソッドと逆のto_intsメソッドを定義
・to_hexメソッドは3角整数を受け取り16進数に変換した文字列を返す。文字列の戦闘には#をつける
・to_intsメソッドはRGBカラーを表す16進数文字列を受け取り、RGBそれぞれを10進数の整数に変換した値を配列として返す
```

- テストファイル
  test/rgb_test.rb

```rb
require 'minitest/autorun'
require './lib/rgb'

class RgbTest < Minitest::Test
  # to_hexメソッドのテスト
  def test_to_hex
    assert_equal '#000000', to_hex(0, 0, 0)
    assert_equal '#ffffff', to_hex(255, 255, 255)
    assert_equal '#043c78', to_hex(4, 60, 120)
  end

  # to_intsメソッドのテスト
  def test_to_ints
    assert_equal [0, 0, 0], to_ints('#000000')
    assert_equal [255, 255, 255], to_ints('#ffffff')
    assert_equal [4, 60, 120], to_ints('#043c78')
  end
end
```

- 実装ファイル
  lib/rgb.rb

```rb
# 0を00にする rjustメソッド（デフォルトは空白で桁揃え）
'0'.rjust(5) #=> "    0"
'0'.rjust(5, '0') #=> "00000"
'0'.rjust(5, '_') #=> "____0"

# injectメソッドを利用してリファクタリング
def to_hex(r, g, b)
  [r, g, b].inject('#') do |hex, n|
    hex + n.to_s(16).rjust(2, '0')
  end
end

# scanメソッド、mapメソッド復習、&:メソッド名を利用してリファクタリング
# 戻り値は何かを意識する。scanの戻り値は配列
def to_ints(hex)
    hex.scan(/\w\w/).map(&:hex)
end
```

# DRY原則 Dont Repeat Yourself

# 配列について
```rb
a = [1,2,3,4,5]
a[1,3] #=> 2つ目の要素から3つ分取り出す
a.values_at(0,2,4) #=> 取得したい要素の添字を複数指定できる
a[a.size - 1] #=> 配列の長さ-1で最後の要素を取得
a[-1] #=> 最後の要素を取得
a[-2] #=> 最後から2番目の要素を取得
a[-2, 2] #=> 最後から2番めの要素から2つの要素を取得
a.last #=> 最後の要素を取得
a.last(2) #=> 最後の要素から2つ分取得
a.first #=> 最初の要素を取得
a.first(2) #=> 最初の要素から2つを取得

b = [1,2,3,4,5]
b[-3] = 10 #=> 後ろから3要素目を10に置き換える

c = [1,2,3,4,5]
c[1, 3] = 100 #=> 2つ目から3要素分を100に置き換える

d = []
d << 2
d.push(1,2,3) #=> 複数の要素を末尾に追加

e = [1,2,3,1,2,3]
e.delete(2) #=> 削除した値が戻り値になる 2

# 配列の連結
a = [1]
b = [2,3]
a.concat(b) #=> [1,2,3]
p a #=> 変更される（破壊的） [1, 2, 3]
p b #=> 変更されない [2, 3]

a = [1]
b = [2,3]
a + b #=> [1,2,3] なるべくこっち使う
p a #=> 変更されない [1]
p b #=> 変更されない [2, 3]

# 配列の和集合、差集合、積集合
a = [1,2,3]
b = [3,4,5]
# どれも非破壊的
a | b #=> 和集合(|) [1, 2, 3, 4, 5]
a - b #=> 差集合(-) 右の配列から左の配列に含まれる要素を取り除く [1, 2]
a & b #=> 積集合(&) 2つの配列に共通する要素を返す [3]

# ※本格的な集合演算をする場合はSetクラスを使用する。効率的
require 'set'

a = Set.new([1,2,3])
b = Set.new([3,4,5])
p a | b #=> #<Set: {1, 2, 3, 4, 5}>
p a - b #=> #<Set: {1, 2}>
p a & b #=> #<Set: {3}>

# 多重代入で残りの全要素を配列として受け取る
e,*f = 100, 200, 300
p e #=> 100
p f #=> [200, 300]

# 1つの配列を複数の引数として展開する
a = []
a.push(1)
a.push(2,3) #=> [1, 2, 3]

a = []
b = [2,3]
a.push(1)
a.push(b) #=> [1,[2,3]]

# 1つの配列、ではなく複数の引数として渡すには * をつける
# *で配列を展開できる
a = []
b = [2,3]
a.push(1)
a.push(*b) #=> [1,2,3]
```

## メソッドの可変長引数
```rb
# 個数に制限のない引数のこと = 可変長引数
def メソッド名(引数1, 引数2, *可変長引数) #=> * つける
  # メソッドの処理
end
# 可変長引数は配列として受け取れる
def greeting(*name)
  "#{name.join('と')}、こんにちは"
end
greeting('田中さん') #=> "田中さん、こんにちは"
greeting('田中さん', '鈴木さん') #=> "田中さんと鈴木さん、こんにちは"
greeting('田中さん', '鈴木さん', '佐藤さん') #=> "田中さんと鈴木さんと佐藤さん、こんにちは"
```

## 配列つづき
```rb
# * で配列同士を非破壊的に連結する
a = [1,2,3]
p [a] #=> 配列の配列になる [[1, 2, 3]]
p [*a] #=> 展開されて別の要素になる [1, 2, 3]

a = [1,2,3]
b = [-1, 0, *a, 1, 2, 3] #=> [-1, 0, 1, 2, 3, 1, 2, 3] 簡潔
c = [-1,0] + a + [1,2,3] #=> [-1, 0, 1, 2, 3, 1, 2, 3]

# == で等しい配列かどうか判断する
[1,2,3] == [1,2,3] #=> true
[1,2,3] == [1,2,4] #=> false
[1,2,3] == [1,2,3,4] #=> false

# %で文字列の配列を完結に作る
# % %w %W
['apple','melon','orange'] #=>  ["apple", "melon", "orange"]
%w!apple melon orange! #=> ["apple", "melon", "orange"]
%w(apple melon orange) #=> ["apple", "melon", "orange"]
%w(big\ apple small\ melon large\ orange) #=> ["big apple", "small melon", "large orange"]
# 式展開や　改行、タブ文字を入れたい場合は大文字のW
prefix = 'This is'
%W(#{prefix}\ an\ apple small\nmelon big\torange) #=> 略

# 文字列を配列に変換する
# charsメソッドとsplitメソッド
'Ruby'.chars #=> ["R", "u", "b", "y"]
'Ruby,Java,Perl,PHP'.split(',') #=> ["Ruby", "Java", "Perl", "PHP"]

# 配列に初期値を設定する
# []ではなくArray.new
a = Array.new(5) #=> [nil, nil, nil, nil, nil]
b = Array.new(5, 0) #=> [0, 0, 0, 0, 0]
# ブロックを使って初期値を設定
c = Array.new(10) {|n| n % 3 + 1} #=> [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]

# 配列に初期値を設定する場合の注意点
a = Array.new(5, 'default') #=> 要素が5つで初期値defaultの配列
str = a[0] #=> 初期値を取得
str.upcase! #=> 1番目[0]の要素を大文字に変換
p a #=> 全て大文字になってる！！ ["DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT"]

# 配列の全要素が同じ文字列のオブジェクトを参照しているために発生した
# 回避のためにはブロックで初期値を渡すべし
a = Array.new(5) { 'default' } #=> ["default", "default", "default", "default", "default"]
str = a[0]
str.upcase!
a #=> 先頭の要素のみ大文字に！ ["DEFAULT", "default", "default", "default", "default"]
```

# ミュータブルとイミュータブル
```
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
```

# ブロックについて
```rb
# each_with_indexメソッド
fruits = ['apple', 'orange', 'melon']
fruits.each_with_index { | fruit, i| puts "#{i}: #{fruit}"}
#=> 0: apple
#=> 1: orange
#=> 2: melon

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

# 添字を0以外の数値から開始させる
fruits = ['apple', 'orange', 'melon']
# eachで繰り返しつつ1から始まる添字を取得
fruits.each.with_index(1){ |fruit, i| puts "#{i}: #{fruit}" }
```

```rb
# 配列ガブロック引数に渡される場合
dimensions = [
  # [縦, 横]
  [10, 20],
  [30, 40],
  [50, 60]
]
areas = [] #=> 面積の計算結果を入れる
# ブロック引数が1個であれば、ブロック引数の値が配列になる
dimensions.each do |dimension|
  length = dimension[0]
  width = dimension[1]
  areas << length * width
end
areas #=> [200, 1200, 3000]

# ブロック引数を複数（配列の要素分だけ）用意すると、各要素の値が別々に変数に格納される
# 元の配列より多く指定した場合はnilになる
areas = []
dimensions.each do |length, width|
  areas << length * width
end
areas #=> [200, 1200, 3000]

# each_with_index もとから2つの引数を取る場合、受け取るブロック引数を()で囲むと配列を別々の引数として受け取れる
dimensions.each_with_index do |(length, width), i|
  puts "length: #{length}, width: #{width}, i: #{i}"
end
```

```rb
# 繰り返し処理以外でも使用されるブロック
# sample.txtを開いて文字列を書き込む（クローズ処理は自動的に行われる）
File.open("./sample.txt", "w")do |file|
  file.puts("1 line")
  file.puts("2 line")
  file.puts("3 line")
end

# {}をブロックとして使う場合は()を省略できない！
# p a.delete 100 { 'NG' } #=> syntax error
# p a.delete(100) { 'NG' }
a = [1,2,3]
p a.delete(100)
a.delete(100) do
  p 'NG'
end

a.delete 100 do
  p 'NG' #=> 100 {'NG'}と解釈される。100はただの数値でメソッドではないのでブロック引数を渡せずに構文エラーになる
end

# ブロックを使うメソッドは自分で定義できる
names = ['田中','佐藤','鈴木']
san_names = names.map { |name| "#{name}さん"}
san_names.join('と') #=> "田中さんと佐藤さんと鈴木さん"

# 1行で書ける。ブロック位の後ろに.を書く
names.map { |name| "#{name}さん" }.join('と') #=> "田中さんと佐藤さんと鈴木さん"

# endの後ろにも付けられる
names_to = names.map do |name|
  "#{name}さん"
end.join('と') 
names_to #=> "田中さんと佐藤さんと鈴木さん"
```

# ★配列をいじったりするばあいはAPIも見る！
(ArrayクラスAPIドキュメント)[https://docs.ruby-lang.org/ja/latest/class/Array.html]
(EnumerableクラスAPIドキュメント)[https://docs.ruby-lang.org/ja/latest/class/Enumerable.html]