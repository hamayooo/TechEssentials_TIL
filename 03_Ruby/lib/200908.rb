# if文が戻り値を返す => if文の戻り値を変数に入れる
country = 'us'
greeting =
  if country == 'japan'

    'こんにちは'
  elsif country == 'us'
    'Hello'
  else
    '???'
  end

puts greeting

# 後置if
point = 7
day = 1
# 1日であればポイント5倍
point *= 5 if day == 1
puts point

# メソッドの定義 def
def add(a,b)
  a **= b
end 
puts add(2,4)

# Rubyでは最後に評価された式がメソッドの戻り値になる！
# returnは不要
# 使えるが書かないほうが主流
# returnはメソッドを途中で脱出する時に使われる
def greeting(country)
  return 'countryを入力してください' if country.nil?
  if country == 'japan'
    'こんにちは'
  else
    'Hello'
  end
end

puts greeting(nil)
puts greeting('japan')

# String クラスのオブジェクト
puts 'abc'.class #=> String

# %記法で文字列を作成
# %q! ! で囲む エスケープする必要がない。
puts %q!He said, "Don't speak."!

# %Q! !は””と同じ。式展開が使える
something = "Hello."
puts %Q!He said, "#{something}"!

# %! !ダブルクオートと同じ
something = "Hello."
puts %!He said, "#{something}"!

# 区切り文字は任意の記号や文字がつかえる！
# %q{ }、%q? ?とか！

# ヒアドキュメント
a = <<text
bbbbb
text
puts a

html = <<HTML
<p>ヒアドキュメント</p>
HTML
puts html

def some_method
  <<-text
  これはヒアドキュメント
  で
  す
  インデントしてる？
  text
end
puts some_method

name = 'Alice'
a = <<text
こんにちは #{name}さん
式展開もできるよ
text
puts a

name = 'Beat'
a = <<'text'
こんにちは #{name}さん
式展開が無効になるよ
text
puts a

name = 'Beat'
a = <<"text"
こんにちは #{name}さん
これは式展開するよ
text
puts a

# ヒアドキュメントを直接引数として渡す。
# 自動返信メールとかで使うのかな。phpはそうだったな
a = 'Ruby'
a.prepend(<<text)
Java
PHP
text
puts a

# 直接upcaseメソッドを呼び出す
b = <<TEXT.upcase
Hello,
Good-bye,
monday
TEXT
puts b

# フォーマットを指定して文字列を作成 sprintf
# 表示に指定がある場合
# %0.3f 少数第3位
# 形が難しい、珍しい
puts sprintf('%0.3f', 1.2)
puts '%0.3f' % 1.2
puts sprintf('%0.3f + %0.3f', 1.2, 0.48)
puts '%0.3f + %0.3f' % [1.2, 0.48]

# 配列を連結して文字列にする
puts [10,20,30].join

# *演算子を使って文字列を繰り返す
puts 'Hi!' * 10

# 文字と文字列の違いはない。1文字でも文字列
puts ?a

# 整数リテラル
puts 0b11111111.to_i
puts 0377.to_i
puts 0xff.to_i

# ビット演算
# てなに？
# https://qiita.com/Ingward/items/43acda931c8a62c70d2f
# 無数のスイッチのON/OFFの切り替えを制御する