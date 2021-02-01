class Foo
  def self.bar
    puts 'Hello!'
  end

  # クラス構文直下でクラスメソッドを呼び出せる！不思議か！
  self.bar

  3.times do
    puts 'hello...'
  end
end

# インスタンスメソッドからクラスメソッドを呼び出す場合
# クラス名.メソッド
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # 金額を整形するクラスメソッド
  def self.format_price(price)
    p "#{price}円"
  end

  def to_s
    # インスタンスメソッドからクラスメソッドを呼び出す
    formatted_price = Product.format_price(price)
    # self.class.format_price(price)ともかける！
    "name: #{name}, price: #{formatted_price}"
  end
end

product = Product.new('A great movie', 1000)
p product.to_s #=> "name: A great movie, price: 1000円"


# クラスの継承
=begin
親クラス = スーパークラス
子クラス = サブクラス
サブクラス is a スーパークラス　で違和感なければOKの可能性が高い

・rubyの継承は単一継承。継承できるスーパークラスは1つのみ
・頂点はobjectクラス（Basic objectクラスがruby1.9から頂点にいる）でOK
=end

# objectクラスはデフォルトで継承される
class User
end

# メソッドの呼び出しができる
# objectクラスを継承してるから
user = User.new
user.to_s #=> #<User:0x00007fbc8589e128>
user.nil? #=> false

# 継承チェック
User.superclass #=> Object

# Objectクラスから継承したメソッドの一覧が取得できる
user = User.new
user.methods.sort #=>[:!, :!=, :!~, :<=>, :==, :===, :=~, :__id__, :__send__, :class, :clone, :define_singleton_method, :display, :dup, :enum_for, :eql?, :equal?, :extend, :freeze, :frozen?, :hash, :inspect, :instance_eval, :instance_exec, :instance_of?, :instance_variable_defined?, :instance_variable_get, :instance_variable_set, :instance_variables, :is_a?, :itself, :kind_of?, :method, :methods, :nil?, :object_id, :private_methods, :protected_methods, :public_method, :public_methods, :public_send, :remove_instance_variable, :respond_to?, :send, :singleton_class, :singleton_method, :singleton_methods, :taint, :tainted?, :tap, :to_enum, :to_s, :trust, :untaint, :untrust, :untrusted?]

# オブジェクトのクラスを確認する
class User 
end

user = User.new
user.class #=> User
user.instance_of?(User) #=> true
user.instance_of?(String) #=> false

# instance_of?はクラスが全く同じではないとエラー
user.instance_of?(Object) #=> false

# is_a?（kind_of?）は継承関係を含めて確認
user.is_a?(User) #=> true
user.is_a?(Object) #=> true
user.is_a?(BasicObject) #=> true
user.is_a?(String) #=> false 関係ないのはエラー

# class サブクラス < スーパークラス
# end
# まずはProductクラスを作成、Objectクラスを勝手に継承する
class Product
  # スーパークラスで定義したものはサブクラスでは定義不要
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "name: #{name}, price: #{price}"
  end
end
product = Product.new('movie', 1000)
product.name #=> "movie"
product.price #=> 1000

# DVDクラスはProductクラスを継承する
class DVD < Product
  # 再生時間を定義
  attr_reader :running_time

  def initialize(name, price, running_time)
    # スーパークラスにも存在している属性 >>> スーパークラスのメソッドを呼べる！
    # @name = name
    # @price = price
    super(name, price)
    # super # >>> 引数をすべてスーパークラスのメソッドに渡す
    @running_time = running_time
  end

  def to_s
    "#{super}, running_time: #{running_time}"
  end
end
dvd = DVD.new('movie', 1000, 120)
dvd.name #=> "movie"
dvd.price #=> 1000
dvd.running_time #=> 120
p dvd.to_s #=> "name: movie, price: 1000, running_time: 120"

