# 4.6
# RGB変換プログラムを作成する
=begin
・10進数を16進数に変換するto_hexメソッドと逆のto_intsメソッドを定義
・to_hexメソッドは3角整数を受け取り16進数に変換した文字列を返す。文字列の戦闘には#をつける
・to_intsメソッドはRGBカラーを表す16進数文字列を受け取り、RGBそれぞれを10進数の整数に変換した値を配列として返す
=end

require 'minitest/autorun'
require './lib/rgb'

class RgbTest < Minitest::Test
  # to_hexメソッドのテスト
  def test_to_hex
    assert_equal '#000000', to_hex(0, 0, 0)
    assert_equal '#ffffff', to_hex(255, 255, 255)
    assert_equal '#043c78', to_hex(4, 60, 120)
  end

  # to_intsメソッドのテスト
  def test_to_ints
    assert_equal [0, 0, 0], to_ints('#000000')
    assert_equal [255, 255, 255], to_ints('#ffffff')
    assert_equal [4, 60, 120], to_ints('#043c78')
  end
end