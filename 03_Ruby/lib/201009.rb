# ハッシュから配列へ、配列からハッシュへ
# to_aでハッシュから配列へ
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies.to_a #=> [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]

# to_hで配列からハッシュへ
array = [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
p array.to_h #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

array = [1,2,3,4]
# array.to_h #=> TypeError

# キーが重複した場合は最後に登場した配列の要素がハッシュの値に採用される
array = [[:japan, "yen"], [:japan, "円"]]
p array.to_h #=> {:japan=>"円"}

# 古いバージョンはキーと値のペアの配列をHash[]に渡していた
array = [[:japan, 'yen'],[:us, 'dollar'],[:india, 'rupee']]
p Hash[array] #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

# キーと値が交互に並ぶフラットな配列をsplat展開してもよい
array = [:japan, "yen", :us, "dollar", :india, "rupee"]
p Hash[*array] #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

# ハッシュの初期値を理解する
# キーがなければハッシュを返す
h = Hash.new('hello')
p h[:foo]
p h[:bar]
# ※ 初期値は毎回同じオブジェクトを返す。そのため初期値に破壊的な変更を加えると、他の変数も一緒に変わる

a = h[:foo]
b = h[:bar]
p a.equal?(b) #=> true 同じオブジェクト

a.upcase!
p a #=> HELLO 破壊的に変更
p b #=> HELLO
p h #=> {} ハッシュ自身は空のまま

# Hash.newとブロックを組み合わせて初期値を返すことで、ミュータブルなオブジェクトを初期値として返せる
h = Hash.new{ 'hello' }
a = h[:foo] #=> "hello"
b = h[:bar] #=> "hello"

# 変数aと変数bは異なるオブジェクト！
p a.equal?(b) #=> false

# 変数aには快適な変更をしても変数bの値は変わらない
a.upcase!
p a #=> "HELLO"
p b #=> "hello"
p h #=> {} ハッシュ自身は空のまま

# Hash.newにブロックを与えると、初期値だけじゃなくハッシュに指定されたキーと初期値を同時に指定する
h = Hash.new{ |hash, key| hash[key] = 'hello' }
a = h[:foo]
b = h[:bar]
p a #=> "hello"
p b #=> "hello"
p h #=> {:foo=>"hello", :bar=>"hello"} ハッシュにキーと値が追加されている


# シンボル詳しく
:apple #=> the シンボル
:$dollar #=> グローバル変数の識別子
:@at_mark #=> インスタンス変数の識別子

# これはエラー
# :1234
# :ruby-is-fun
# :ruby is fun
# :()

# 式展開もできる
name = 'Alice'
p :"#{name.upcase}" #=> :ALICE 

# ハッシュを作成する際に文字列：値の形式で書いても:文字列とみなされキーがシンボルになる
hash = { 'abc': 123 }
p hash #=> {:abc=>123}

# %s記法でシンボルを作成
p %s!ruby is fun! #=> :"ruby is fun"

# ()を区切り文字に
p %s(ruby is fun) #=> :"ruby is fun"

# シンボルの配列を作るときは%i
p %i(apple orange melon) #=> [:apple, :orange, :melon]

# 改行含めたり、式展開する場合は%I(I大文字)
name = "Alice"
p %I(hello\ngood-bye #{name.upcase}) #=> [:"hello\ngood-bye", :ALICE]

# to_symメソッド（エイリアス > intern）で文字列をシンボルに変換
string = 'apple'
symbol = :apple
p string.to_sym #=> :apple
p string.to_sym == symbol #=> true

# to_sメソッド(エイリアス > id2name)でシンボルを文字列に変換
string = 'apple'
symbol = :apple
p symbol.to_s #=> "apple"
p string == symbol.to_s #=> true
p string +  symbol.to_s #=> "appleapple"

# まとめ
・ハッシュとシンボル
・5章繰り返し読むべし