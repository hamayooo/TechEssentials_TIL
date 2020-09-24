# 4.5 Range
# 範囲オブジェクト
1..5
1...5
'a'..'e'
'a'...'e'

p (1..5).class 
p ('a'...'e').class 

# ..  最後の値を含む
# ... 最後の値を含まない
range = 1..5 # 最後の値を含む
p 'range = 1..5'
p range.include?(4.9)
p range.include?(5)

range = 1...5 # 最後の値を含まない
p 'range = 1...5'
p range.include?(4.9999) #=> true
p range.include?(4.9999999) #=> true
p range.include?(4.9999999999) #=> true
p range.include?(4.999999999999999) #=> true
p range.include?(4.9999999999999999) #=> false

# 4.5.1
a = [1,2,3,4,5]
p a[1..4]
p a[1...4]
b = 'abcdef'
p b[0..2]
p b[0...2]

# 4.5.2
# n以上m以下、n以上m未満の判定

#不等号を使う場合
def liquid?(temperature)
  # 0度以上100度未満であれば液体
  0 <= temperature && temperature < 100
end
p liquid?(-1)
p liquid?(0)
p liquid?(99)
p liquid?(100)

# 範囲オブジェクトを使う場合
def liquid?(temperature)
  (0...100).include?(temperature)
end
p liquid?(-1)
p liquid?(0)
p liquid?(99)
p liquid?(100)

# 4.5.3 case文で
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
p charge(3)
p charge(12)
p charge(13)
p charge(25)

