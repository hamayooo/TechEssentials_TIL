# 定数
class Product
  # デフォルトの価格を定数として定義する
  DEFAULT_PRICE = 0

  attr_reader :name, :price

  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end
end

product = Product.new('A free movie')
p product.price #=> 0

定数は大文字、数字、アンスコで構成されることが多い
DEFAULT_PRICE = 0
UNITS = { m: 1.0, ft: 3.28, in: 39.37 }

# インスタンスメソッド内でもクラスメソッド内でも同じ方法で参照することができる
class Product
  DEFAULT_PRICE = 0

  def self.default_price
    #クラスメソッドから定数を参照する
    DEFAULT_PRICE
  end

  def default_price
    #インスタンスメソッドから定数を参照する
    DEFAULT_PRICE
  end
end

Product.default_price #=> 0
product = Product.new
p product.default_price #=> 0