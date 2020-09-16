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
```