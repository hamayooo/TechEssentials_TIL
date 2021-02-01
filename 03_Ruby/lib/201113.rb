# クラス定義・Ruby言語仕様
# エイリアスメソッド定義
class User
  def hello
    'Hello'
  end

  # helloメソッドのエイリアスメソッドとしてgreetingを定義する
  alias greeting hello
end

user = User.new
p user.hello #=> "Hello"
p user.greeting #=> "Hello"

# メソッドの削除
class User
  # freezeメソッドの定義を削除
  undef freeze
end

user = User.new
# p user.freeze #=> undefined method `freeze'

# ネストしたクラスの定義
class User
  # privateなどはつけられない
  class BloodType
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end
end

blood_type = User::BloodType.new('B')
p blood_type.type #=> "B"

