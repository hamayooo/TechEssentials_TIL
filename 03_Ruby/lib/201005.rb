# シンボル
# 文字列と同じだけどクラスが違う
:apple.class #=> Symbol
'apple'.class #=> String

# 文字列より高速に処理できる
:apple.object_id #=> 1000988 同じ
:apple.object_id #=> 1000988 同じ
:apple.object_id #=> 1000988 同じ

'apple'.object_id #=> 70254618135700 違う
'apple'.object_id #=> 70254618135620 違う
'apple'.object_id #=> 70254618135540 違う

# ★特徴
# - 内部的には整数なので高速に値を比較できる
# - 同じシンボルは同じオブジェクトのためメモリ使用効率がよい
# - イミュータブルオブジェクトのため勝手に値が書き換えられない

# ハッシュのキーにシンボルを使う
currencies  = { :japan => 'yen', :us => 'dollar', :india => 'rupee'}
currencies[:us]
currencies[:italy] = 'euro'
currencies[:italy]

# シンボルがキーになる場合はシンボル： 値でハッシュw作成できる
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }

# キーも値もシンボル
currencies = { japan: :yen, us: :dollar, india: :rupee}
currencies[:us]
currencies = { :japan => :yen, :us => :dollar, :india => :rupee}

# 文字列のキーとハッシュのキーを混在させる
hash = { 'abc' => 123, def: 456}
hash[:def]
hash['abc']

person = {
  # 値が文字列
  name: 'Alice',
  # 値が数値
  age: 20,
  # 値が配列
  friends: ['Bob', 'Carol'],
  # 値がハッシュ
  phones: { home: '123-0002', mobile: '3456-1234'}
}

person[:name]
person[:age]
person[:friends]
person[:phones][:mobile]

# メソッドのキーワード引数とハッシュ
def buy_burger(menu, drink, potate)
  # ハンバーガーを購入
  if drink
    # ドリンクを購入
  end
  if potate
    # ポテトを購入
  end
end

# チーズバーガーとドリンクとポテトを購入する
buy_burger('cheese', true, true)
# フィッシュバーガーとドリンクを購入する
buy_burger('fish', true, false)

# が、これだけだとメソッド見ても分かりづらいので、メソッドのキーワード引数を使う
def メソッド名(キーワード引数１： デフォルト値)
  # メソッドの実装
end

# シンボル:値　の形式で引数を指定する
def buy_burger(menu, drink: true, potate: true)
  # 略
end

# 引数の役割が明確に！
buy_burger('cheese', drink: true, potate: true)
buy_burger('fish', drink: true, potate: false)

# キーワード引数にはデフォルト値が設定される
buy_burger('cheese') #=> drink,potate はデフォtrueなので指定しない
buy_burger('fish', potate: false) #=> drinkはデフォtrueなので指定しない

# キーワード引数は呼び出し時の順番自由！
buy_burger('fish', potate: false, drink: true)

# デフォルト値を書いてない場合は省略不可
def buy_burger(menu, drink:, potate:)
  #省略
end
buy_burger('fish', drink: true, potate: true) 
buy_burger('fish', potate: false) #=> エラー。省略しちゃダメ

# キーワード引数を使うメソッドを呼び出す場合、キーワード引数に一致するハッシュ（キーはシンボル）を引数として渡すことができる
params = {drink: true, potate: false}
buy_burger('fish', params)