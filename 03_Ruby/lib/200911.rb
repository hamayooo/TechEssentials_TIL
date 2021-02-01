# 2.10.5
# 条件演算子 三項演算子
n = 11
if n > 10
  puts '10より大きい'
else
  puts '10以下'
end

# こうなる！
message = n > 12 ? '10より大きい' : '10以下'
puts message

# メソッド定義について
# 引数が少ない、多いとエラーに
# def greeting(country) ##定義
  # puts greeting ## 少ない
  # puts greeting('japan', 'us') ## 多い

# 引数なしの場合はcountryに'japan'を設定する
def greeting(country = 'japan')
  if country == 'japan'
    'こんにちは'
  else
    'hello'
  end
end
puts greeting
puts greeting('us')

# デフォルト値ありとなしの引数を混在させる
def default_args(a, b, c = 0, d = 0)
  "a = #{a}, b = #{b}, c = #{c}, d = #{d}"
end
puts default_args(1,2)
puts default_args(1,2,3)
puts default_args(1,2,3,4)

# 固定の値だけでなく動的に変わる値・メソッドの戻り値を指定したりできる
# システム日時や他のメソッドの戻り値をデフォルト値に指定する
def foo(time = Time.now, message = bar)
  puts "time: #{time}, message: #{message}"
end

def bar
  'BAR'
end
puts foo

# 2.11.2 ?で終わるメソッド
# Rubyのメソッドは?や!で終わらせることができる

# 空文字であればtrue、でなければfalse
puts ''.empty?
puts 'abc'.empty?

# 引数の文字列が含まれているtrue 、含まれてないfalse
puts 'watch'.include?('at')
puts 'watch'.include?('in')

# 奇数ならtrue 偶数false
puts 1.odd?
puts 2.odd?

# 偶数true 奇数false
puts 1.even?
puts 2.even?

# オブジェクトがnilならtrue
puts nil.nil?
puts 'acb'.nil?
p 1.nil?

# 2.11.3 !で終わるメソッド
# 使用する際は注意が必要
# 呼び出したオブジェクトの状態を変えてしまう「破壊的メソッド」
a = 'ruby'
a.upcase
p a

a.upcase!
p a

# 引数として渡された文字列を逆順に並び替えさらに大文字に変更する破壊的メソッドを定義
def reverse_upcase!(s)
  s.reverse!.upcase!
end
s = 'ruby'
p reverse_upcase!(s)
p s