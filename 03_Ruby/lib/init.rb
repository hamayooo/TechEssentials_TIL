### ruby version 2.4.10
###  
### 

puts 1 + 2

a = 'Hello, world'
puts a

b = 'こんちは'
puts b

# 文字列に変換
puts '1'.to_s
# 数値
puts 1.to_s
puts 1.to_s()
# nil(null)
puts nil.to_s
# true
puts true.to_s
# false
puts false.to_s
# 正規表現
puts /\d+/.to_s

# 数値を16進数の文字列に変換
puts 10.to_s(16) #カッコあり
puts 10.to_s 16 #カッコなし

# 改行が区切りになる。1行のときはセミコロンで
puts 1.to_s; '1'.to_s; 10.to_s(16); # 改行
print 2.to_s #  1行
p 3.to_s #デバッグ用

# 変数
msg = "hello world"
puts msg

# 定数
# - 大文字

# インスタンス、メソッド
# Instance.Method
# - 文字列 String Class
"hello world".length # .reverse

# - 数値 Float Class
1.1.round # .floor

# 式展開
name = "hamaguchi"
puts "name is #{name}"

# !　破壊的なメソッド
# puts name.upcase
# puts name
# puts name.upcase!
# puts name


# ? 真偽値
p name.empty?
p name.include?("m")

