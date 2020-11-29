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
# p user.hello #=> private method `hello' called for #<User:0x00007fec9f09c7f0> (NoMethodError)

# self.privateメソッドは呼び出せない ※selfトルと呼び出せる
p user.greeting #=> private method `name' called for #<User:0x00007fc6301390e0> (NoMethodError)