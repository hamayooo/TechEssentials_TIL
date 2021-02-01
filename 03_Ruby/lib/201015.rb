# クラスの作成を理解する
# 改札機をプログラムする

# ハッシュだと壊れやすい、大きくなるとハッシュだと管理しきれない
# User クラスを定義
class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  # 氏名を作成するメソッド
  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end
end

# ユーザのデータを作成する
users = []
users <<  User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 30)

# ユーザのデータを表示する
users.each do |user|
  puts "氏名: #{full_name(user)}、年齢: #{user.age}"
end

# p users[0].first_meme #=> タイプミスでエラー
# p users[0].country = 'japan' #=> 属性追加不可
# p users[0].first_name = 'Carol' #=> 属性追加不可
