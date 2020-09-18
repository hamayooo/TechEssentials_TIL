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
new_numbers = numbers.map { |n| n *10 }

# select(エイリアスメソッドはfind_all)
numbers = [1,2,3,4,5,6]
# ブロックの戻り値が真になった要素だけが集められる
even_numbers = numbers.select { |n| n.even? }

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