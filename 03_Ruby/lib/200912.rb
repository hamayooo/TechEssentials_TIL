# ガベージコレクション
=begin
使用されなくなったオブジェクトを回収し、自動的にメモリを開放。
メモリ管理を意識する必要がない
=end

# エイリアスメソッド
=begin
全く同じメソッドに違う名前がついてること
=end
'hello'.length
'hello'.size

# 2.12.3 式と文
## 値を返し、結果を変数に代入できるものが式
## 値を返さず、結果を変数に代入しようとすると構文エラーになるものが文
# if文も式
a =
  if true
    '真です'
  else
    '偽です'
  end
p a 

# メソッドの定義も実は値を返してる
b = def foo; end
p b

# 2.12.4 疑似変数
# nil,true,false は疑似変数
p self # オブジェクト自身
p __FILE__ # 現在のソースファイル名
p __LINE__ # 現在のソースファイルの行番号
p __ENCODING__ # 現在のソースファイルのスクリプトエンコーディング

# 2.12.5 参照の概念を理解する
=begin
Rubyの変数にはオブジェクトへの参照が格納される
オブジェクトそのものではない
=end

a = 'hello'
b = 'hello'
# 2つは違うオブジェクト
puts a.object_id # 70195406495580
puts b.object_id # 70195406495560
# cにbを代入しても同じオブジェクト
c = b
puts c.object_id # 70195406495560
# メソッドの引数にcを渡す。引数dはb,cと同じオブジェクト
def m(d)
  d.object_id
end
puts m(c)
# equal?メソッドを使っても同じオブジェクトか確認できる
puts a.equal?(b)
puts b.equal?(c)

=begin
オブジェクトの状態が変わると、同じオブジェクトを参照している全ての変数に影響がある
=end

# 大文字に変更する破壊的メソッドを定義
def m!(d)
  d.upcase!
end
# cに適用
puts m!(c)
# b,cいずれも大文字になる
puts b
puts c

# 2.12.7 require
=begin
組み込みライブラリでない標準ライブラリやgemを利用する場合、明示的にライブラリを読み込む
=end

# require
# １回しかライブラリやrbファイルを読み込まない
# Date.today #Name Error
require 'date'
date = Date.today
puts date

# require './sample'

# # load
# load './sample.rb'

# require_ralative
require_relative './sample'