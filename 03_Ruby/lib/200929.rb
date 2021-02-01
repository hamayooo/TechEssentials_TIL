# 4.8.6 繰り返し処理以外でも使用されるブロック
# sample.txtを開いて文字列を書き込む（クローズ処理は自動的に行われる）
File.open("./sample.txt", "w")do |file|
  file.puts("1 line")
  file.puts("2 line")
  file.puts("3 line")
end

# 4.8.7
a = [1,2,3]
p a.delete(100)
a.delete(100) do
  p 'NG'
end

a.delete 100 do
  p 'NG'
end

# 100 {'NG'}と解釈される。100はただの数値でメソッドではないのでブロック引数を渡せずに構文エラーになる
# {}をブロックとして使う場合は()を省略できない！
# p a.delete 100 { 'NG' } #=> syntax error
# p a.delete(100) { 'NG' }

# 4.8.8
# ブロックを使うメソッドは自分で定義できる
names = ['田中','佐藤','鈴木']
san_names = names.map { |name| "#{name}さん"}
p san_names.join('と') #=> "田中さんと佐藤さんと鈴木さん"

# 1行で書ける。ブロック位の後ろに.を書く
p names.map { |name| "#{name}さん" }.join('と')

# endの後ろにも付けられる
names_to = names.map do |name|
  "#{name}さん"
end.join('と')
p names_to

# ★配列をいじったりするばあいはAPIも見る！
# https://docs.ruby-lang.org/ja/latest/class/Array.html
# https://docs.ruby-lang.org/ja/latest/class/Enumerable.html

