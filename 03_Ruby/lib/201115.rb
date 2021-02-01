# ダックタイピング
class Product
  def initialize(name, price)
    @name = name
    @price = price
  end

  def display_text
    # stock?メソッドはサブクラスで必ず実装してもらう想定
    stock = stock? ? 'あり' : 'なし'
    "商品名： #{@name} 価格: #{@price}円 在庫: #{@stock}"
  end

  def stock?
    raise 'Must implement stock? in subclass.'
  end
end

class DVD < Product
  def stock?
    true
  end
end

product = Product.new('film', 1000)
p product.display_text #=> Must implement stock? in subclass. (RuntimeError)

dvd = DVD.new('movie', 3000)
p dvd.display_text #=> "商品名： movie 価格: 3000円 在庫: "

# メソッドの有無を調べる
# respond_to?
# 条件分岐とか使える
s = 'Alice'
p s.respond_to?(:split) #=> true
p s.respond_to?(:name) #=> false