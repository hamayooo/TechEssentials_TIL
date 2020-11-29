# ふぅ
# 1
p "問1"
menu = {coffee: 300, caffe_latte: 400}
p menu[:caffe_latte]

# 2
p "問2"
menu = {"モカ" => "チョコレートシロップとミルク入り", "カフェラテ" => "ミルク入り"}
p menu["モカ"]

# 3
p "問3"
menu = {coffee: 300, caffe_latte: 400}
menu[:tea] = 300 
p menu

# 4
p "問4"
menu = {coffee: 300, caffe_latte: 400}
menu.delete(:coffee)
p menu

# 5
p "問5"
menu = {coffee: 300, caffe_latte: 400}
unless menu == nil
  puts '紅茶はありませんか？'
end
p menu[:tea]

p "問5-2"
menu = {coffee: 300, caffe_latte: 400}
puts '紅茶はありませんか？' unless menu[:tea]


# 6
p "問6"
menu = {coffee: 300, caffe_latte: 400}
if menu[:caffe_latte] <= 500
  p 'カフェラテください'
end

# 7
p "問7"
item =  "caffelatte".chars
# ・分解して配列に
# ・アルファベットをキー
# ・回数を値にセット
# ・ハッシュを作る
p item.group_by(&:itself).map { |k, v| [k,v.count] }.to_h

# 8
p "問8"
menu = {"コーヒー" => 300, "カフェラテ" => 400}
menu.each { |key, value|
  p "#{key} - #{value}"
}

# 9
p "問9"
menu.each { |key, value|
  if value >= 350
    p "#{key} - #{value}"
  end
}

# 10
p "問10"
menu = {}.each { |key, value|
  p "#{key} - #{value}"
}

# 11
p "問11"
menu = {"コーヒー" => 300, "カフェラテ" => 400}
p menu.keys

# 12
p "7-1 問1"
def order(name)
  puts "#{name}をください"
end
puts order("カフェラテ")

# 13
p "7-2 問2"
def area(tate, yoko)
  puts tate * yoko
end
puts area(3, 3)
