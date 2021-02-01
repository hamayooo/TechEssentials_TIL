# 再定義…
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
