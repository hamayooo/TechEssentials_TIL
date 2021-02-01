# ハッシュ[キー] = 値
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}

# イタリアの硬貨を追加する
currencies['italy'] = 'euro'
p currencies #=> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee", "italy"=>"euro"}

# 既存の値を上書きする
currencies['japan'] = '円'
p currencies #=> {"japan"=>"円", "us"=>"dollar", "india"=>"rupee", "italy"=>"euro"}

# 値を取得する
p currencies['india'] #=> "rupee"
p currencies['brazil'] #=> nil

# ハッシュを使った繰り返し処理
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
# 引数2つ!
currencies.each do |key, value|
  puts "#{key} : #{value}"
end

# ブロック引数を1つにすると、値が配列に格納される
currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}

currencies.each do |key_value|
  key = key_value[0]
  value = key_value[1]
  puts "#{key} : #{value}"
end

p currencies.size #=> 3

p currencies.delete('japan')
p currencies #=>{"us"=>"dollar", "india"=>"rupee"}

# ブロックを渡すとキーが見つからないときの戻り値を作成できる
p currencies.delete('italy') { |key| "Not found: #{key}" }