# 2.10.3
# unless 条件が偽担った場合だけ処理を実行する
# status = 'error'
# # if status != 'ok'
# #   puts 'なにか異常があります'
# # end

# # unless status == 'ok'
# #   puts 'error!'
# # end
# status = 'ok'
# unless status == 'ok'
#   puts 'error!'
# else
#   puts 'ok!'
# end

# elsif　に変わるものはない！
# 戻り値を直接変数に代入
status = 'ok'
message = 
  unless status == 'ok'
    'error!'
  else
    'ok!'
  end
puts message

# 修飾子として使う
puts 'そんなバカな' unless status == 'ok'
puts 'やはりそうか' unless status == 'error'

# 2.10.4
# case 複数の条件を指定する場合。elsifよりシンプルになる
country = 'アメリカ'
case country
when 'japan', '日本' # 複数
  puts 'こんにちは'
when 'us', 'アメリカ'
  puts 'Hello'
when 'italy', 'イタリア'
  puts 'chao'
else
  '???'
end

# 変数に入れることが可能
bbb = 'italy'

message =
case bbb
when 'japan'
  'こんにちは'
when 'us'
  'Hello'
when 'italy'
  'ciao ciao'
else
  '???'
end
puts message

# then で1行に使用頻度はそれほど高くない
ccc = 'italy'

case country
when 'japan' then 'こんにちは'
when 'us' then 'Hello'
when 'italy' then 'ciao ciao ciao'
else '???'
end