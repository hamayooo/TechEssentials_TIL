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
最後まで終わるとブロックの戻り値がinjectメソッドの戻り値になる
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


# 繰り返し処理
```rb
# timesメソッド
sum = 0
# 5回繰り返す
5.times { |n| sum += n }
sum #=> 10

# uptoメソッド / downtoメソッド
a = []
-1.upto(14) { |n| a << n }
a #=> [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

a = []
9.downto(-4) { |n| a << n }
a #=> [9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2, -3, -4]

# stepメソッド
a = []
# 1から10まで2つずつ
1.step(10, 2) { |n| a << n }
a #=> [1, 3, 5, 7, 9]

a = []
# 10から1まで-2つずつ
10.step(1, -2) { |n| a << n }
a #=> [10, 8, 6, 4, 2]

# whileとuntil
## while 条件式（真であれば実行）
##   繰り返したい処理
## end
a = []
while a.size < 5
  a << 1
end
a #=> [1, 1, 1, 1, 1]

a = []
# do を入れると1行で
while a.size < 5 do a << 1 end
a #=> [1, 1, 1, 1, 1]

a = []
# 修飾子としてwhileを後ろに置くほうがきれい
a << 1 while a.size < 5
a #=> [1, 1, 1, 1, 1]

a = []
while false #=> 偽になるので実行されない
  a << 1
end
a #=> []

begin #=> begin...end で囲むとどんな条件でも最低1回は実行される
  a << 1
end while false
a #=> [1]

## untile 条件式（偽であれば実行）
##   繰り返したい処理
## end

a = [10,20,30,40,50]
until a.size <= 3
  a.delete_at(-1)
end
a #=> [10, 20, 30]

# for文
## for 変数 in 配列やハッシュ（eachメソッドを定義しているオブジェクトであれば何でもOK）
##   繰り返し処理
## end

numbers = [1,2,3,4]
sum = 0
for n in numbers
  sum += n
end
sum #=> 10

sum = 0
for n in numbers do sum += n end
sum #=> 10

numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum += n
end
sum #=> 10

numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end
n #=> NameError
sum_value #=> NameError

sum = 0
for n in numbers
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end
n #=> 4
sum_value #=> 40

# loopメソッド
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
```

# 繰り返し処理の制御構造
- break
- next
- redo

```rb
# Enumerableモジュールに定義されているmapメソッド、selectメソッド
# Arrayクラス、RangeクラスEnumeratorクラス（uptoメソッドの戻り値）はEnumerableモジュールをインクルードしているため、Enumerableモジュールのメソッドが使える
1.upto(5).class #=> Enumerator

# 4.10 繰り返し処理用の制御
# break
# shuffleメソッド:配列の要素をランダムに並び替える
numbers = [1,2,3,4,5].shuffle
numbers.each do |n|
  puts n
  # 5が出たら繰り返しを抜ける
  break if n == 5
end

# while内で使う
numbers = [1,2,3,4,5].shuffle
i = 0
while i < numbers.size
  n = numbers[i]
  puts n
  break if n == 5
  i += 1
end

# breakに引数を渡すとwhile文やfor文の戻り値になる。引数を渡さないとnil
ret = 
  while true
    break
  end
p ret #=> nil

ret =
  while true
    break 123
  end
p ret #=> 123

# 繰り返しが入れこのときは１番内側を抜ける
fruits = ['apple', 'melon', 'orange']
numbers = [1,2,3]
fruits.each do |fruit|
  numbers.shuffle.each do |n|
    puts "#{fruit}, #{n}"
    # numbersループは抜けるがfruitsループは継続
    break if n == 3
  end
end

# throwとcatch
# 一気に外側のループも抜ける。Kernelモジュールのthrowメソッドとcatchメソッドを使う。例外処理とは関係ない！なんと！

# catch タグ do
#   # 繰り返し処理など
#   throw タグ
# end

fruits = ['apple', 'melon', 'orange']
numbers = [1,2,3]
catch :done do #=> シンボル
  fruits.shuffle.each do |fruit|
    numbers.shuffle.each do |n|
      puts "#{fruit}, #{n}"
      if fruit == 'orange' && n == 3
        # 全ての繰り返しを脱出
        throw :done #=> catchと一致しない場合はエラー
      end
    end
  end
end

# throwメソッドに第２引数を渡すとcatchメソッドの戻り値になる
# 繰り返し処理無くても動くけど繰り返しの脱出で使われることが多い
ret = 
  catch :done do
    throw :done
  end
p ret

ret = 
  catch :done do
    throw :done, 123
  end
p ret

# next
numbers = [1,2,3,4,5]
numbers.each do |n|
  next if n.even?
  puts n
end

numbers = [1,2,3,4,5]
i = 0
while i < numbers.size
  n = numbers[i]
  i += 1
  next if n.even?
  puts n
end

fruits = ['桃', '苺', '葡萄']
numbers = [1,2,3,4,5]
fruits.each do |fruit|
  numbers.each do |n|
    next if n.even?
    puts "#{fruit}, #{n}"
  end
end

# redo
# 繰り返し処理をやり直す
foods = ['ピーマン','トマト','セロリ']
foods.each do |food|
  print "#{food}はすきですか？"
  answer = ['はい','いいえ'].sample
  puts answer

  # はいでなければもう一度聞き返す
  redo unless answer == 'はい'
end
```

# ハッシュ
```rb
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}

# イタリアの硬貨を追加する
currencies['italy'] = 'euro'
currencies #=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee", "italy"=>"euro"}

# 既存の値を上書きする
currencies['japan'] = '円'
currencies #=> {"japan"=>"円", "us"=>"dollar", "india"=>"rupee", "italy"=>"euro"}

# 値を取得する
currencies['india'] #=> "rupee"
currencies['brazil'] #=> nil

# ハッシュを使った繰り返し処理
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
# 引数2つ!
currencies.each do |key, value|
  puts "#{key} : #{value}"
end

# ブロック引数を1つにすると、値が配列に格納される
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}

currencies.each do |key_value|
  key = key_value[0]
  value = key_value[1]
  puts "#{key} : #{value}"
end

currencies.size #=> 3
currencies.delete('japan')
currencies #=>{"us"=>"dollar", "india"=>"rupee"}

# ブロックを渡すとキーが見つからないときの戻り値を作成できる
currencies.delete('italy') { |key| "Not found: #{key}" } #=> "Not found: italy"
```

# シンボル
```rb
# シンボル
# 文字列と同じだけどクラスが違う
:apple.class #=> Symbol
'apple'.class #=> String

# 文字列より高速に処理できる
p :apple.object_id #=> 1000988 同じ
p :apple.object_id #=> 1000988 同じ
p :apple.object_id #=> 1000988 同じ

p 'apple'.object_id #=> 70254618135700 違う
p 'apple'.object_id #=> 70254618135620 違う
p 'apple'.object_id #=> 70254618135540 違う

# ★特徴
# - 内部的には整数なので高速に値を比較できる
# - 同じシンボルは同じオブジェクトのためメモリ使用効率がよい
# - イミュータブルオブジェクトのため勝手に値が書き換えられない
```

# ハッシュとシンボル
```rb
# ハッシュのキーにシンボルを使う
currencies  = { :japan => 'yen', :us => 'dollar', :india => 'rupee'}
currencies[:us] #=> 呼び出し
currencies[:italy] = 'euro' #=> 追加

# シンボルがキーになる場合はシンボル： 値でハッシュを作成可能
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }

# キーも値もシンボルの場合
currencies = { japan: :yen, us: :dollar, india: :rupee}
currencies[:us] #=> 呼び出し
currencies = { :japan => :yen, :us => :dollar, :india => :rupee} #=> 同じ

# 文字列のキーとハッシュのキーを混在させる
hash = { 'abc' => 123, def: 456} #=> やらない
hash[:def]
hash['abc']

person = { #=> こういう場合はありそう
  # 値が文字列
  name: 'Alice',
  # 値が数値
  age: 20,
  # 値が配列
  friends: ['Bob', 'Carol'],
  # 値がハッシュ
  phones: { home: '123-0002', mobile: '3456-1234'}
}

person[:name]
person[:age]
person[:friends]
person[:phones][:mobile] #=> 値がハッシュだったときの呼び出し方

# メソッドのキーワード引数とハッシュ
def buy_burger(menu, drink, potate)
  # ハンバーガーを購入
  if drink
    # ドリンクを購入
  end
  if potate
    # ポテトを購入
  end
end

# チーズバーガーとドリンクとポテトを購入する
buy_burger('cheese', true, true)
# フィッシュバーガーとドリンクを購入する
buy_burger('fish', true, false)

# が、これだけだとメソッド見ても分かりづらいので、メソッドのキーワード引数を使う
def メソッド名(キーワード引数1 : デフォルト値)
  # メソッドの実装
end

# シンボル:値　の形式で引数を指定する
def buy_burger(menu, drink: true, potate: true)
  # 略
end

# 引数の役割が明確に
buy_burger('cheese', drink: true, potate: true)
buy_burger('fish', drink: true, potate: false)

# キーワード引数にはデフォルト値が設定される
buy_burger('cheese') #=> drink,potate はデフォtrueなので指定しない
buy_burger('fish', potate: false) #=> drinkはデフォtrueなので指定しなくてもOK

# キーワード引数は呼び出し時の順番自由
buy_burger('fish', potate: false, drink: true)

# デフォルト値を書いてない場合は省略不可
def buy_burger(menu, drink:, potate:) #=> 値無くてもOK
  #省略
end
buy_burger('fish', drink: true, potate: true) 
buy_burger('fish', potate: false) #=> エラー。省略しちゃダメ

# キーワード引数を使うメソッドを呼び出す場合、キーワード引数に一致するハッシュ（キーはシンボル）を引数として渡すことができる
params = {drink: true, potate: false}
buy_burger('fish', params)
```

# ハッシュ詳しく
```
よく使うメソッド
keys
values
has_key?/key?/include?/member?
```

```rb
# keys
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
currencies.keys #=> [:japan, :us, :india]

# values
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
currencies.values #=> ["yen", "dollar", "rupee"]

# has_key?/key?/include?/member? > has_key?のエイリアスメソッド
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
currencies.has_key?(:japan) #=> true
currencies.has_key?(:italy) #=> false

# API参照
# https://docs.ruby-lang.org/ja/latest/class/Hash.html
# https://docs.ruby-lang.org/ja/latest/class/Enumerable.html

# ハッシュの展開
h = { us: 'dollar', india: 'rupee' }
# 変数hのキーと値を**で展開 **を付けないと構文エラーに
{ japan: 'yen', **h } #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee" }

# **の代わりにmergeメソッド
{ japan: 'yen' }.merge(h) #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee" }

# ハッシュを使った疑似キーワード引数
def buy_burger(menu, options = {})
  drink = options[:drink]
  pogate = options[:potate]
  #省略
end
buy_burger('cheese', drink: true, potate: true)

# 任意のキーワードを受け付ける **引数
def buy_burger(menu, drink: true, potate: true, **other)
  # 省略
end
buy_burger('fish', drink: true, potate: false, salad: true, chicken: false) #=> {:salad => true, :chicken => false}

# メソッドの呼び出し時の{}の省略
# 最後の引数がハッシュであればハッシュリテラルの{}を省略できる
# optionsは任意のハッシュを受け付ける
def buy_burger(menu, options = {})
  # 省略
end

# ハッシュを第2引数として渡す
buy_burger('fish', {'drink' => true, 'porate' => false}) #=> {"drink" => true, "porate" => false}

# ハッシュリテラル{}を省略してメソッドを呼び出す
buy_burger('fish', 'drink' => true, 'porate' => false)

# 最後の引数がハッシュじゃないとエラー、最後ではない場所でハッシュを引数に使いたい場合は、{}を付けて普通にハッシュを作成する

# ハッシュリテラルの{}とブロックの{}
# ※気付けるか
def buy_burger(options = {}, menu)
  puts options
end
buy_burger({'drink' => true, 'potate' => false}, 'fish')
# メソッド呼び出しのカッコを外してみる
buy_burger{'drink' => true, 'potate' => false}, 'fish' #=> 構文エラー。ブロックと解釈されるため
# 第一引数にハッシュを渡す場合は必ず()を付けてメソッドを呼び出す
# 第二引数にハッシュを渡す場合は()を省略できる
buy_burger 'fish', {'drink' => true, 'potate' => false}  #=> OK
# 更に最後の引数がハッシュの場合は{}を省略できる
buy_burger 'fish', 'drink' => true, 'potate' => false

# ハッシュから配列へ、配列からハッシュへ
# to_aでハッシュから配列へ
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
currencies.to_a #=> [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]

# to_hで配列からハッシュへ
array = [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
array.to_h #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

array = [1,2,3,4]
# array.to_h #=> TypeError

# キーが重複した場合は最後に登場した配列の要素がハッシュの値に採用される
array = [[:japan, "yen"], [:japan, "円"]]
array.to_h #=> {:japan=>"円"}

# 古いバージョンはキーと値のペアの配列をHash[]に渡していた
array = [[:japan, 'yen'],[:us, 'dollar'],[:india, 'rupee']]
Hash[array] #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

# キーと値が交互に並ぶフラットな配列をsplat展開してもよい
array = [:japan, "yen", :us, "dollar", :india, "rupee"]
Hash[*array] #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

# ハッシュの初期値を理解する
# キーがなければハッシュを返す
h = Hash.new('hello')
h[:foo]
h[:bar]
# ※ 初期値は毎回同じオブジェクトを返す。そのため初期値に破壊的な変更を加えると、他の変数も一緒に変わる

a = h[:foo]
b = h[:bar]
a.equal?(b) #=> true 同じオブジェクト

a.upcase!
a #=> HELLO 破壊的に変更
b #=> HELLO
h #=> {} ハッシュ自身は空のまま

# Hash.newとブロックを組み合わせて初期値を返すことで、ミュータブルなオブジェクトを初期値として返せる
h = Hash.new{ 'hello' }
a = h[:foo] #=> "hello"
b = h[:bar] #=> "hello"

# 変数aと変数bは異なるオブジェクト！
a.equal?(b) #=> false

# 変数aには快適な変更をしても変数bの値は変わらない
a.upcase!
a #=> "HELLO"
b #=> "hello"
h #=> {} ハッシュ自身は空のまま

# Hash.newにブロックを与えると、初期値だけじゃなくハッシュに指定されたキーと初期値を同時に指定する
h = Hash.new{ |hash, key| hash[key] = 'hello' }
a = h[:foo]
b = h[:bar]
a #=> "hello"
b #=> "hello"
h #=> {:foo=>"hello", :bar=>"hello"} ハッシュにキーと値が追加されている
```

# シンボル詳しく
```rb
# シンボル詳しく
:apple #=> the シンボル
:$dollar #=> グローバル変数の識別子
:@at_mark #=> インスタンス変数の識別子

# これはエラー
:1234
:ruby-is-fun
:ruby is fun
:()

# 式展開もできる
name = 'Alice'
p :"#{name.upcase}" #=> :ALICE 

# ハッシュを作成する際に文字列：値の形式で書いても:文字列とみなされキーがシンボルになる
hash = { 'abc': 123 }
p hash #=> {:abc=>123}

# %s記法でシンボルを作成
p %s!ruby is fun! #=> :"ruby is fun"

# ()を区切り文字に
p %s(ruby is fun) #=> :"ruby is fun"

# シンボルの配列を作るときは%i
p %i(apple orange melon) #=> [:apple, :orange, :melon]

# 改行含めたり、式展開する場合は%I(I大文字)
name = "Alice"
p %I(hello\ngood-bye #{name.upcase}) #=> [:"hello\ngood-bye", :ALICE]

# to_symメソッド（エイリアス > intern）で文字列をシンボルに変換
string = 'apple'
symbol = :apple
p string.to_sym #=> :apple
p string.to_sym == symbol #=> true

# to_sメソッド(エイリアス > id2name)でシンボルを文字列に変換
string = 'apple'
symbol = :apple
p symbol.to_s #=> "apple"
p string == symbol.to_s #=> true
p string +  symbol.to_s #=> "appleapple"
```

# まとめ
```
・ハッシュとシンボル
・5章繰り返し読むべし
```


# 正規表現
```
正規表現のなんたるかはQiitaで学べ その1~4
https://qiita.com/jnchito/items/893c887fbf19e17d3ff9
https://qiita.com/jnchito/items/64c3fdc53766ac6f2008
https://qiita.com/jnchito/items/6f0c885c1c4929092578
https://qiita.com/jnchito/items/b0839f4f4651c29da408
```

```rb
regex = /\d{3}-\d{4}/
regex.class #=> Regexp

# =~:マッチした場合はマッチした文字列の開始位置が返る（true）
'123-4567' =~  /\d{3}-\d{4}/ #=> 0

# マッチしない場合はnil
'hello' =~  /\d{3}-\d{4}/ #=> nil

# if文などでよく使う
if '123-4567' =~ /\d{3}-\d{4}/
  puts 'マッチしました'
else
  puts 'マッチしませんでした'
end

# !~:マッチしなければtrue
'hello' !~  /\d{3}-\d{4}/ #=> true
'123-4567' !~  /\d{3}-\d{4}/ #=> false

# Rubularでいろいろと
# https://rubular.com/

# 正規表現のキャプチャを利用する
text = '私の誕生日は1977年7月17日です'
m = /(\d+)年(\d+)月(\d+)日/.match(text)
m[0] #=> "1977年7月17日"
m[1] #=> "1977"
m[2] #=> "7"
m[3] #=> "17"

# 処理結果を配列と同じような方法で取得
m[2,2] #=> ["7", "17"]
m[-1] #=> "17"
m[1..3] #=> ["1977", "7", "17"]

# matchメソッドはStringクラスとRegexpクラスの両方に定義されてる。文字列と正規表現オブジェクトを入れ替えても同じ様に動く
text = '私の誕生日は1977年7月17日です'
m = text.match(/(\d+)年(\d+)月(\d+)日/)
m #=> #<MatchData "1977年7月17日" 1:"1977" 2:"7" 3:"17">

# ?<name> メタ文字を使って名前をつける
text = '私の誕生日は1977年7月17日です'
m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)
# シンボルで名前を指定してキャプチャの結果を取得
m[:year] #=> "1977"
m[:month] #=> "7"
m[:day] #=> "17"
m['year'] #=> "1977" 文字列もOK
m[2] #=> "7" 連番も指定OK

# 左辺に正規表現リテラル、右辺に文字列を置いて=~演算子を使うとキャプチャの名前がローカル変数に割り当てられる
# - 右辺と左辺を入れ替えると使えない
# - 一旦変数に入れても使えない。直接左辺に置く
text = '私の誕生日は1977年7月17日です'
if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text
  puts "#{year}/#{month}/#{day}"
end #=> 1977/7/17


# 正規表現と一緒に使うと便利なStringクラスのメソッド
# - scan マッチすると配列に入れて返す
'123 456 789'.scan(/\d+/) #=> ["123", "456", "789"]
'1977年7月17日 2016年12月31日'.scan(/(\d+)年(\d+)月(\d+)日/) #=> [["1977", "7", "17"], ["2016", "12", "31"]]
# グループ化はしたいがキャプチャはしたくない場合は(?:)
'1977年7月17日 2016年12月31日'.scan(/(?:\d+)年(?:\d+)月(?:\d+)日/) #=> ["1977年7月17日", "2016年12月31日"]
'1977年7月17日 2016年12月31日'.scan(/\d+年\d+月\d+日/) #=> 簡単に書く["1977年7月17日", "2016年12月31日"]

# - [], slice, slice! 文字列から正規表現にマッチした部分を抜き出す
text = '郵便番号は123-4567'
text[/\d{3}-\d{4}/] #=> "123-4567"
text = '123-3456 345-4678'
text[/\d{3}-\d{4}/]  #=> "123-3456" マッチした最初の文字列が帰る

# キャプチャを使うと第２引数で取得するキャプチャを指定できる
text = '誕生日は1977年7月17日です'
text[/(\d+)年(\d+)月(\d+)日/] #=> "1977年7月17日"
text[/(\d+)年(\d+)月(\d+)日/, 3] #=> "17"

# 名前付きキャプチャであれば名前で指定することもできる
text = '誕生日は1977年7月17日です'
text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, :day] #=> 17
text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, 'day'] #=> 17

# sliceメソッドは[]のエイリアスメソッド
text = '郵便番号は123-4567'
text.slice(/\d{3}-\d{4}/) #=> "123-4567"

text = '誕生日は1977年7月17日です'
text.slice(/(\d+)年(\d+)月(\d+)日/, 3) #=> "17"

# slice!にすると破壊的に取り除かれる
text = '郵便番号は123-4567です'
text.slice!(/\d{3}-\d{4}/) #=> "123-4567"
text #=> "郵便番号はです"

# split
text = '123,456-789'
text.split(',') #=> ["123", "456-789"]
text.split(/,|-/) #=> ["123", "456", "789"]

# gsub, gsub! 第二引数の文字列で置き換える
text = '123,456-789'
text.gsub(',', ':') #=> "123:456-789"
text.gsub(/,|-/, ':') #=> "123:456:789"
```

# クラス
```
- クラス
  一種のデータ型。オブジェクトの設計図、雛形。
  クラスが同じであれば保持している属性（データ項目）や使えるメソッドは（原則として）同じになる


- オブジェクト・インスタンス・レシーバ
  クラスをもとにして作られたデータのかたまりをオブジェクトという。
  設計図から作られる、赤い車や青い車などのオブジェクト。同じクラスから作られたオブジェクトは同じ属性やメソッドを持つが、属性の中に保持されるデータはオブジェクトによって異なる。
  
  alice = User.new('Alice', 'Ruby', 20)
  
  ・Alice Rubyさん20歳というユーザのオブジェクトを作成する
  
  ★オブジェクトとインスタンスは同義。オブジェクトをレシーバといったりもする

  user = User.new('Alice', 'Ruby', 20)
  user.first_name

  ・2行目でUserオブジェクトのfirst_nameメソッドを呼び出している
  ・first_nameメソッドのレシーバはuserです


- メソッド・メッセージ
  オブジェクトが持つ動作や振る舞い。メッセージとも呼ばれる。
  2行目ではuserというレシーバに対して、first_nameというメッセージを送っている
  ※レシーバとメッセージと言う呼び方はSmalltalkというオブジェクト指向言語でよく使われる


- 状態（ステート）
  Userの状態。名前、年齢、赤とか

- 属性（アトリビュート、プロパティ）
  オブジェクトから取得（or設定）できる値のことを属性。属性=名詞のことがおおい。
```

```rb
# クラスの定義
class User
end

class OrderItem
end

# クラスからオブジェクトを作成する場合はnewメソッドを使う
User.new

# このとき呼ばれるのがinitializeメソッド
# 必ず実行すべき初期化処理などを行わせる事ができる
# 引数も持てる。その場合はinitializeメソッドに渡す値は、newメソッドの引数に指定する
class User
  def initialize
    puts 'Initialized'
  end
end
User.new #=> Initialized

# インスタンスメソッドの定義
# クラス内で定義したメソッド = インスタンスメソッドとなる
# そのクラスのインスタンスに対して呼び出すことができるメソッド
class User
  # インスタンスメソッドの定義
  def hello
    puts "Hello!"
  end
end

user = User.new
# インスタンスメソッドの呼び出し
user.hello #=> Hello

# インスタンス変数とアクセサメソッド
class User 
  def initialize(name)
    @name = name
  end

  def hello
    # インスタンス変数に保存されている名前を表示
    puts "Hello, I am #{@name}."
  end

  # クラス外からインスタンス変数を参照するためのメソッド
  def name
    puts @name
  end

  # クラス外からインスタンス変数の内容を変更したいとき
  def name=(value) #=> スペースあけるとエラー
    puts @name = value
  end
end

user = User.new('Alice')
user.hello #=> Hello, I am Alice.
user.name #=> Alice
user.name = 'Bob'

# インスタンス変数を読み書きするメソッドのことをアクセサメソッドという
# attr_accessor メソッドを使うと、外部から読み書きするメソッドを自動で定義できる
class Member
  attr_accessor :name
  # attr_reader :name
  # attr_writer :name
  # 読み取り専用のときはattr_reader、書き込み専用のときはattr_writer

  def initialize(name)
    puts @name = name
  end

end

member = Member.new('Mike')
# @nameを参照する
member.name
# @nameを変更する
member.name = 'Tom'

# 複数の引数をカンマで渡せる！
class User
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

user = User.new('Alice', 20)
user.name #=> "Alice"
user.age #=> 20

# クラスメソッドの定義
# そのクラスに関連は深いものの、一つ一つのインスタンスに含まれるデータは使わないメソッド
class User
  def initialize(name)
    @name = name
  end

  # self.を付けるとクラスメソッドになる
  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end

  def hello
    "Hello I am #{@name}."
  end
end

names = ['Alice', 'Bob', 'Carol']
# クラスメソッドの呼び出し
users = User.create_users(names)
users.each do |user|
  # インスタンスメソッドの呼び出し
  puts user.hello
end

# 定数
# デフォルトの価格を定数として定義できる
class Product
  # デフォルトの価格を定数として定義する
  DEFAULT_PRICE = 0

  attr_reader :name, :price

  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end
end

product = Product.new('A free movie')
p product.price #=> 0

# 定数は大文字、数字、アンスコで構成されることが多い
DEFAULT_PRICE = 0
UNITS = { m: 1.0, ft: 3.28, in: 39.37 }

# インスタンスメソッド内でもクラスメソッド内でも同じ方法で参照することができる
class Product
  DEFAULT_PRICE = 0

  def self.default_price
    #クラスメソッドから定数を参照する
    DEFAULT_PRICE
  end

  def default_price
    #インスタンスメソッドから定数を参照する
    DEFAULT_PRICE
  end
end

Product.default_price #=> 0
product = Product.new
p product.default_price #=> 0
```

## クラスメソッド・インスタンスメソッド/呼び出し
```rb
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def hello
    # selfなしでnameメソッドを呼ぶ
    "Hello, I am #{name}."
  end

  def hi
    # self付きでnameメソッドを呼ぶ
    "Hi, I am #{self.name}."
  end

  def my_name
    # 直接インスタンス変数の@nameにアクセスする
    "My name is #{@name}."
  end
end

user = User.new('Alice')
p user.hello #=>"Hello, I am Alice."
p user.hi #=> "Hi, I am Alice."
p user.my_name #=> "My name is Alice."

class Foo
  # このputsはクラス定義の読み込み時に呼び出される
  puts "クラス構文の直下のself: #{self}"

  def self.bar
    puts "クラスメソッド内のself: #{self}"
  end

  def baz
    puts "インスタンスメソッド内のself: #{self}"
  end
end
#=> クラス構文の直下のself: Foo　

Foo.bar #=> クラスメソッド内のself: Foo  Foo = .selfてことか

foo = Foo.new
foo.baz #=> インスタンスメソッド内のself: #<Foo:0x00007f8c490c7178> Fooクラスのインスタンスを表す

# なので、下記はエラー
class Foo
  def self.bar
    # クラスメソッドからインスタンスメソッドを呼び出す
    self.baz
  end

  def baz
    # インスタンスメソッドからクラスメソッドを呼び出す
    self.bar
  end
end

p Foo.bar
#=> `bar': undefined method `baz' for Foo:Class (NoMethodError)

foo = Foo.new
p foo.baz
#=> `baz': undefined method `bar' for #<Foo:0x00007fbf578ca320> (NoMethodError)

# クラス構文直下でのメソッドの呼び出し
class Foo
  def self.bar
    puts 'Hello!'
  end

  # クラス構文直下でクラスメソッドを呼び出せる！不思議か！
  self.bar

  3.times do
    puts 'hello...'
  end
end

# インスタンスメソッドからクラスメソッドを呼び出す場合
# クラス名.メソッド
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # 金額を整形するクラスメソッド
  def self.format_price(price)
    p "#{price}円"
  end

  def to_s
    # インスタンスメソッドからクラスメソッドを呼び出す
    formatted_price = Product.format_price(price)
    # self.class.format_price(price)ともかける！
    "name: #{name}, price: #{formatted_price}"
  end
end

product = Product.new('A great movie', 1000)
p product.to_s #=> "name: A great movie, price: 1000円"
```

## クラスの継承
```
親クラス = スーパークラス
子クラス = サブクラス
サブクラス is a スーパークラス　で違和感なければOKの可能性が高い

・rubyの継承は単一継承。継承できるスーパークラスは1つのみ
・頂点はobjectクラス（Basic objectクラスがruby1.9から頂点にいる）でOK
```

```rb
# Objectクラスはデフォルトで継承される
class User
end

# メソッドの呼び出しができる
# Objectクラスを継承してるから
user = User.new
user.to_s #=> #<User:0x00007fbc8589e128>
user.nil? #=> false

# 継承チェック
User.superclass #=> Object

# Objectクラスから継承したメソッドの一覧が取得できる
user = User.new
user.methods.sort #=>[:!, :!=, :!~, :<=>, :==, :===, :=~, :__id__, :__send__, :class, :clone, :define_singleton_method, :display, :dup, :enum_for, :eql?, :equal?, :extend, :freeze, :frozen?, :hash, :inspect, :instance_eval, :instance_exec, :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set, :instance_variables, :is_a?, :itself, :kind_of?, :method, :methods, :nil?, :object_id, :private_methods, :protected_methods, :public_method, :public_methods, :public_send, :remove_instance_variable, :respond_to?, :send, :singleton_class, :singleton_method, :singleton_methods, :taint, :tainted?, :tap, :to_enum, :to_s, :trust, :untaint, :untrust, :untrusted?]

# オブジェクトのクラスを確認する
class User 
end

user = User.new
user.class #=> User
user.instance_of?(User) #=> true
user.instance_of?(String) #=> false

# instance_of?はクラスが全く同じではないとエラー
user.instance_of?(Object) #=> false

# is_a?（kind_of?）は継承関係を含めて確認
user.is_a?(User) #=> true
user.is_a?(Object) #=> true
user.is_a?(BasicObject) #=> true
user.is_a?(String) #=> false 関係ないのはエラー

# class サブクラス < スーパークラス
# end
# まずはProductクラスを作成、Objectクラスを勝手に継承する
class Product
  # スーパークラスで定義したものはサブクラスでは定義不要
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "name: #{name}, price: #{price}"
  end
end
product = Product.new('movie', 1000)
product.name #=> "movie"
product.price #=> 1000

# DVDクラスはProductクラスを継承する
class DVD < Product
  # 再生時間を定義
  attr_reader :running_time

  def initialize(name, price, running_time)
    # スーパークラスにも存在している属性 >>> スーパークラスのメソッドを呼べる！
    # @name = name
    # @price = price
    super(name, price)
    # super # >>> 引数をすべてスーパークラスのメソッドに渡す
    @running_time = running_time
  end

  def to_s
    "#{super}, running_time: #{running_time}"
  end
end
dvd = DVD.new('movie', 1000, 120)
dvd.name #=> "movie"
dvd.price #=> 1000
dvd.running_time #=> 120
dvd.to_s #=> "name: movie, price: 1000, running_time: 120"


# クラスメソッドの継承
class Foo
  def self.hello
    'hello'
  end
end

class Bar < Foo
end

p Foo.hello #=> "hello"
p Bar.hello #=> "hello"

# メソッドの公開レベル
# public
# protected
# private

# publicメソッド
# initialize以外のメソッドはデフォルトでこっち

# privateメソッド
# クラスの内部のみで使えるメソッド
# クラス内でprivateキーワードを書く
class User
  def greeting
    # hello、nameはprivateメソッドなのでselfを付けるとエラーに
    "#{hello}, I am #{self.name}"
  end

  # ここから下で定義されたメソッドはprivate
  private

  def hello
    'Hello!'
  end

  def name
    'Alice'
  end
end
user = User.new

# privateメソッドは呼び出せない
user.hello #=> private method `hello' called for #<User:0x00007fec9f09c7f0> (NoMethodError)

# self.privateメソッドは呼び出せない ※selfトルと呼び出せる
user.greeting #=> private method `name' called for #<User:0x00007fc6301390e0> (NoMethodError)

# サブクラスからスーパークラスのprivateメソッドを呼び出せる！

# private下に書いてprivateメソッドになるのはインスタンスメソッドのみ！クラスメソッドはprivateにならない
class User
  private

  # クラスメソッド
  def self.hello
    'hello!'
  end
end

# 呼べる！
User.hello #=> 'hello!'

# クラスメソッドをprivateにしたい場合
class User
  class << self
    private

    def hello
      'hello!'
    end
  end
end

# 呼べない！
User.hello #=> private method `hello' called for User:Class (NoMethodError)


# private,publicの順序
# privateを下の方にまとめて書く
class User
  public #=> 書かなくていい

  def foo
  end

  private

  def hoo
  end
end

# 公開レベル変更できる
class User 
  def foo
  end

  def hoo
  end

  private :foo, :hoo #=> privateメソッドに変更

  # ※これはpublicメソッド
  def baz
    'baz!'
  end
end
user = User.new
user.foo #=> private method `hello' called for User:Class (NoMethodError)
user.hoo #=> private method `hello' called for User:Class (NoMethodError)
user.baz #=> "baz!"


# protectedメソッド
# 外部には公開したくないが、同じクラス・サブクラスの中であればレシーバ付きで呼び出せる
class User
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  protected

  # レシーバ付きで呼び出せる
  def weight
    @weight
  end
end

alice = User.new('Alice', 50)
bob = User.new('Bob', 60)

p alice.heavier_than?(bob) #=> false
p bob.heavier_than?(alice) #=> true
p alice.weight #=> 呼び出せない！ protected method `weight' called for #<User:0x00007f834d0c8a28 @name="Alice", @weight=50> (NoMethodError)
```

```rb
# 定数をもっと詳しく
class Product
  DEFAULT_PRICE = 0
end
# 定数を参照
Product::DEFAULT_PRICE #=> 0

# 外部から参照させたくないとき
class Product
  DEFAULT_PRICE = 0
  private_constant :DEFAULT_PRICE
end

Product::DEFAULT_PRICE #=> private constant Product::DEFAULT_PRICE referenced (NameError)

# メソッドの内部で定数を作成することはできない！

# でも…

# 再代入して値を書き換えることが可能！外部からも。それを防ぐ
class Product
end
# 定数を変更できない。凍結！あまり使わない
Product.freeze

# 定数の値をフリーズする。破壊的な変更を防ぐ
SOME_NAMES = ['Foo', 'Bar', 'Baz'].freeze
# でも、各要素はfreezeされない
Product::SOME_NAMES[0].upcase! #=> FOOになっちゃう
# 中身全部freezeする... 
SOME_NAMES = ['Foo'.freeze, 'Bar'.freeze, 'Baz'.freeze].freeze
# ひどい！mapメソッド使うと良い
SOME_NAMES = ['Foo', 'Bar', 'Baz'].map(&:freeze).freeze
```

```rb
# いろいろな変数
class Product
  # クラスインスタンス変数
  @name = name

  # クラスインスタンス変数
  def self.name
    @name
  end

  # インスタンス変数
  def initialize(name)
    @name = name
  end

  # インスタンス変数
  def name
    @name
  end
end 

class DVD < Product
  @name = 'DVD'

  # クラスインスタンス変数を参照
  def self.name
    @name
  end

  # インスタンス変数を参照
  def upcase_name
    @name.upcase
  end
end

p Product.name #=> "Product"
p DVD.name #=> "DVD"

product = Product.new('movie')
p product.name #=> "movie"

dvd = DVD.new('film')
p dvd.name #=> "film"
p dvd.upcase_name #=> "FILM" ※@nameにはfilmが入ってる

# ※クラスインスタンス変数は別に管理されてる
p Product.name #=> "Product" 
p DVD.name #=> "DVD"
```

# クラス変数
```rb
# クラスメソッド内でもインスタンスメソッド内でも共有かつスーパークラスとサブクラスでも共有される変数
class Product
  @@name = 'Product'

  def self.name
    @@name
  end

  def initialize(name)
    @@name = name
  end

  def name
    @@name
  end
end

class DVD
  @@name = 'DVD'

  def self.name
    @@name
  end

  def upcase_name
    @@name.upcase
  end
end

# DVDクラス定義したタイミングで@@nameがDVDに
p Product.name #=> "DVD"
p DVD.name #=> "DVD"

product = Product.new('movie')
p product.name #=> "movie"

# Product.newのタイミングで@@nameがmovieに
p Product.name #=> "movie"
p DVD.name #=> "movie"


dvd = DVD.new('film')
p dvd.name #=> "film"
p dvd.upcase_name #=> "FILM"

# DVD.newのタイミングで@@nameがfilmに
p product.name #=> "film"
p Product.name #=> "film"
p DVD.name #=> "film"


# グローバル変数、組み込み変数
# $ではじまる
$program_name = 'program'

# グローバル変数に依存するクラス
class Program
  def initialize(name)
    $program_name = name
  end

  def self.name
    $program_name
  end

  def name
    $program_name
  end
end

# Program.newにprogramがすでに名前が代入されている
p Program.name #=> "program"

program = Program.new('Super')
p program.name #=> "Super"

# Program.newのタイミングでSuperに変更
p Program.name #=> "Super"
p $program_name #=> "Super"
```

# クラス定義・Ruby言語仕様
```rb
# エイリアスメソッド定義
class User
  def hello
    'Hello'
  end

  # helloメソッドのエイリアスメソッドとしてgreetingを定義する
  alias greeting hello
end

user = User.new
p user.hello #=> "Hello"
p user.greeting #=> "Hello"

# メソッドの削除
class User
  # freezeメソッドの定義を削除
  undef freeze
end

user = User.new
# p user.freeze #=> undefined method `freeze'

# ネストしたクラスの定義
class User
  # privateなどはつけられない
  class BloodType
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end
end

blood_type = User::BloodType.new('B')
p blood_type.type #=> "B"
```

## 再定義
```rb
class User
  def name=(value)
    @name = value
  end
end

user = User.new
# 変数に代入するかたちでname=メソッドを呼び出せる
user.name = 'Alice'

# オープンクラスとモンキーパッチ
# Stringクラスを継承した独自クラスを定義
class MyString < String
end
s = MyString.new('Hello')
p s #=> "Hello"
p s.class #=> MyString

class MyArray < Array
end
a = MyArray.new()
a << 1
a << 2
p a #=> [1, 2]
p a.class #=> MyArray

class String
  def shuffle
    chars.shuffle.join
  end
end

s = 'Hello, I am Alice.'
p s.shuffle #=> "H le. Aeiocl,a lIm"
p s.shuffle #=> "iHel cel l moa,A.I"
```