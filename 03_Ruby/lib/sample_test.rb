require 'minitest/autorun'

# SampleTestがMinitest::Testを継承
class SampleTest < Minitest::Test # class（7章で説明）
# test_ ではじまるメソッドを探して実行。Minitest
def test_sample
  # 検証メソッド
  # assert_equal 期待する結果, テスト対象となる値や式
  assert_equal 'RUBY', nil.upcase
  end
end