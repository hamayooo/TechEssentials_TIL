# いろいろな変数
class Product
  # クラスインスタンス変数
  @name = name

  # クラスインスタンス変数
  def self.name
    @name
  end

  # インスタンス変数
  def initialize(name)
    @name = name
  end

  # インスタンス変数
  def name
    @name
  end
end 

class DVD < Product
  @name = 'DVD'

  # クラスインスタンス変数を参照
  def self.name
    @name
  end

  # インスタンス変数を参照
  def upcase_name
    @name.upcase
  end
end

p Product.name #=> "Product"
p DVD.name #=> "DVD"

product = Product.new('movie')
p product.name #=> "movie"

dvd = DVD.new('film')
p dvd.name #=> "film"
p dvd.upcase_name #=> "FILM" ※@nameにはfilmが入ってる

# ※クラスインスタンス変数は別に管理されてる
p Product.name #=> "Product" 
p DVD.name #=> "DVD"

# クラス変数
# クラスメソッド内でもインスタンスメソッド内でも共有かつスーパークラスとサブクラスでも共有される変数
class Product
  @@name = 'Product'

  def self.name
    @@name
  end

  def initialize(name)
    @@name = name
  end

  def name
    @@name
  end
end

class DVD
  @@name = 'DVD'

  def self.name
    @@name
  end

  def upcase_name
    @@name.upcase
  end
end

# DVDクラス定義したタイミングで@@nameがDVDに
p Product.name #=> "DVD"
p DVD.name #=> "DVD"

product = Product.new('movie')
p product.name #=> "movie"

# Product.newのタイミングで@@nameがmovieに
p Product.name #=> "movie"
p DVD.name #=> "movie"


dvd = DVD.new('film')
p dvd.name #=> "film"
p dvd.upcase_name #=> "FILM"

# DVD.newのタイミングで@@nameがfilmに
p product.name #=> "film"
p Product.name #=> "film"
p DVD.name #=> "film"


# グローバル変数、組み込み変数
# $ではじまる
$program_name = 'program'

# グローバル変数に依存するクラス
class Program
  def initialize(name)
    $program_name = name
  end

  def self.name
    $program_name
  end

  def name
    $program_name
  end
end

# Program.newにprogramがすでに名前が代入されている
p Program.name #=> "program"

program = Program.new('Super')
p program.name #=> "Super"

# Program.newのタイミングでSuperに変更
p Program.name #=> "Super"
p $program_name #=> "Super"