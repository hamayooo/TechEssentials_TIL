# クラスの定義
class User
end

class OrderItem
end

# クラスからオブジェクトを作成する場合はnewメソッドを使う
User.new

# このとき呼ばれるのがinitializeメソッド
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