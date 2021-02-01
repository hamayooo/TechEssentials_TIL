
# Enumerableモジュールに定義されているmapメソッド、selectメソッド
# Arrayクラス、RangeクラスEnumeratorクラス（uptoメソッドの戻り値）はEnumerableモジュールをインクルードしているため、Enumerableモジュールのメソッドが使える
1.upto(5).class #=> Enumerator

# 4.10 繰り返し処理用の制御
# break
# shuffleメソッド:配列の要素をランダムに並び替える
numbers = [1,2,3,4,5].shuffle
numbers.each do |n|
  puts n
  # 5が出たら繰り返しを抜ける
  break if n == 5
end

# while内で使う
numbers = [1,2,3,4,5].shuffle
i = 0
while i < numbers.size
  n = numbers[i]
  puts n
  break if n == 5
  i += 1
end

# breakに引数を渡すとwhile文やfor文の戻り値になる。引数を渡さないとnil
ret = 
  while true
    break
  end
p ret #=> nil

ret =
  while true
    break 123
  end
p ret #=> 123

# 繰り返しが入れこのときは１番内側を抜ける
fruits = ['apple', 'melon', 'orange']
numbers = [1,2,3]
fruits.each do |fruit|
  numbers.shuffle.each do |n|
    puts "#{fruit}, #{n}"
    # numbersループは抜けるがfruitsループは継続
    break if n == 3
  end
end

# throwとcatch
# 一気に外側のループも抜ける。Kernelモジュールのthrowメソッドとcatchメソッドを使う。例外処理とは関係ない！なんと！

# catch タグ do
#   # 繰り返し処理など
#   throw タグ
# end

fruits = ['apple', 'melon', 'orange']
numbers = [1,2,3]
catch :done do #=> シンボル
  fruits.shuffle.each do |fruit|
    numbers.shuffle.each do |n|
      puts "#{fruit}, #{n}"
      if fruit == 'orange' && n == 3
        # 全ての繰り返しを脱出
        throw :done #=> catchと一致しない場合はエラー
      end
    end
  end
end

# throwメソッドに第２引数を渡すとcatchメソッドの戻り値になる
# 繰り返し処理無くても動くけど繰り返しの脱出で使われることが多い
ret = 
  catch :done do
    throw :done
  end
p ret

ret = 
  catch :done do
    throw :done, 123
  end
p ret

# next
numbers = [1,2,3,4,5]
numbers.each do |n|
  next if n.even?
  puts n
end

numbers = [1,2,3,4,5]
i = 0
while i < numbers.size
  n = numbers[i]
  i += 1
  next if n.even?
  puts n
end

fruits = ['桃', '苺', '葡萄']
numbers = [1,2,3,4,5]
fruits.each do |fruit|
  numbers.each do |n|
    next if n.even?
    puts "#{fruit}, #{n}"
  end
end

# redo
# 繰り返し処理をやり直す
foods = ['ピーマン','トマト','セロリ']
# count = 0
foods.each do |food|
  print "#{food}はすきですか？"
  answer = ['はい','いいえ'].sample
  # answer = 'いいえ'
  puts answer

  # はいでなければもう一度聞き返す
  redo unless answer == 'はい'

  # count += 1
  # redo if answer != 'はい' && count < 2
  # count = 0
end


# ハッシュやシンボルを理解する

# 長さ変換プログラムを作成する
# - メートル、フィート、インチの単位を相互に変換
# - 第１引数に変換元の長さ（数値）、第２引数に変換元の単位、第３引数に変換後の単位を指定する
# - メソッドの戻り値は変換後の長さ（数値）とする。端数が出る場合は少数第３位で四捨五入する

# 学ぶこと
# - ハッシュ
# -  シンボル

# ハッシュ
# 気と値の組み合わせでデータを管理するオブジェクトのこと
# 連想配列、ディクショナリ、マップとか呼ばれる
# ハッシュリテラル

# 空のハッシュ
{}

# キーと値の組み合わせを3つ格納するハッシュ
{ key1 => value1, key2 => value2, key3 => value3}

# ハッシュのクラス
{}.class

#  国ごとに通貨の単位を格納したハッシュを作成
{ 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }

#開業も可能
{
  'japan' => 'yen',
  'us' => 'dollar',
  'india' => 'rupee', #=> 最後に,がついでもOK
}

# ハッシュリテラルの{}とブロックの{}