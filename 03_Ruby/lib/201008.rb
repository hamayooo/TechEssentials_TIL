# ハッシュを使った疑似キーワード引数
def buy_burger(menu, options = {})
  drink = options[:drink]
  pogate = options[:potate]
  #省略
end
buy_burger('cheese', drink: true, potate: true)

# 任意のキーワードを受け付ける **引数
def buy_burger(menu, drink: true, potate: true, **other)
  # 省略
end
buy_burger('fish', drink: true, potate: false, salad: true, chicken: false) #=> {:salad => true, :chicken => false}

# メソッドの呼び出し時の{}の省略
# 最後の引数がハッシュであればハッシュリテラルの{}を省略できる
# optionsは任意のハッシュを受け付ける
def buy_burger(menu, options = {})
  # 省略
end

# ハッシュを第2引数として渡す
buy_burger('fish', {'drink' => true, 'porate' => false}) #=> {"drink" => true, "porate" => false}

# ハッシュリテラル{}を省略してメソッドを呼び出す
buy_burger('fish', 'drink' => true, 'porate' => false)

# 最後の引数がハッシュじゃないとエラー、最後ではない場所でハッシュを引数に使いたい場合は、{}を付けて普通にハッシュを作成する

# ハッシュリテラルの{}とブロックの{}
# ※気付けるか
def buy_burger(options = {}, menu)
  puts options
end
buy_burger({'drink' => true, 'potate' => false}, 'fish')
# メソッド呼び出しのカッコを外してみる
buy_burger{'drink' => true, 'potate' => false}, 'fish' #=> 構文エラー。ブロックと解釈されるため
# 第一引数にハッシュを渡す場合は必ず()を付けてメソッドを呼び出す
# 第二引数にハッシュを渡す場合は()を省略できる
buy_burger 'fish', {'drink' => true, 'potate' => false}  #=> OK
# 更に最後の引数がハッシュの場合は{}を省略できる
buy_burger 'fish', 'drink' => true, 'potate' => false