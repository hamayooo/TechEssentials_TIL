# ハッシュ詳しく
# よく使うメソッド
# keys
# values
# has_key?/key?/include?/member?

# keys
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
currencies.keys #=> [:japan, :us, :india]

# values
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
currencies.values #=> ["yen", "dollar", "rupee"]

# has_key?/key?/include?/member? > has_key?のエイリアスメソッド
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
currencies.has_key?(:japan) #=> true
currencies.has_key?(:italy) #=> false

# API参照
# https://docs.ruby-lang.org/ja/latest/class/Hash.html
# https://docs.ruby-lang.org/ja/latest/class/Enumerable.html

# ハッシュの展開
h = { us: 'dollar', india: 'rupee' }
# 変数hのキーと値を**で展開 **を付けないと構文エラーに
{ japan: 'yen', **h } #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee" }

# **の代わりにmergeメソッド
{ japan: 'yen' }.merge(h) #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee" }

