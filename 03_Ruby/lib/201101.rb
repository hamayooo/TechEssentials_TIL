class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def hello
    # selfなしでnameメソッドを呼ぶ
    "Hello, I am #{name}."
  end

  def hi
    # self付きでnameメソッドを呼ぶ
    "Hi, I am #{self.name}."
  end

  def my_name
    # 直接インスタンス変数の@nameにアクセスする
    "My name is #{@name}."
  end
end

user = User.new('Alice')
p user.hello #=>"Hello, I am Alice."
p user.hi #=> "Hi, I am Alice."
p user.my_name #=> "My name is Alice."

class Foo
  # このputsはクラス定義の読み込み時に呼び出される
  puts "クラス構文の直下のself: #{self}"

  def self.bar
    puts "クラスメソッド内のself: #{self}"
  end

  def baz
    puts "インスタンスメソッド内のself: #{self}"
  end
end
#=> クラス構文の直下のself: Foo　

Foo.bar #=> クラスメソッド内のself: Foo  Foo = .selfてことか

foo = Foo.new
foo.baz #=> インスタンスメソッド内のself: #<Foo:0x00007f8c490c7178> Fooクラスのインスタンスを表す

# なので、下記はエラー
class Foo
  def self.bar
    # クラスメソッドからインスタンスメソッドを呼び出す
    self.baz
  end

  def baz
    # インスタンスメソッドからクラスメソッドを呼び出す
    self.bar
  end
end

p Foo.bar
#=> `bar': undefined method `baz' for Foo:Class (NoMethodError)

foo = Foo.new
p foo.baz
#=> `baz': undefined method `bar' for #<Foo:0x00007fbf578ca320> (NoMethodError)