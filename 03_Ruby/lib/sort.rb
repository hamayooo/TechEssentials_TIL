# Rubyでソートアルゴリズムを作る
# array = [10, 8, 3, 5, 2, 4, 11, 18, 20, 33]
# array_tmp = []
=begin
・[0]は最小、[0]<[1]<[2]...[9]最大とするように数値を比較
・一時的な箱を用意、数字を入れていく
・隣り合う数字と比較するx9回繰り返す
=end

a = [5, 1, 6]

tmp = a.dup

p tmp.object_id
p a.object_id

a[0] = tmp[2]
a[2] = tmp[0]

p a
