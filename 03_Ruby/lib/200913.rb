# 3 テスト自動化
# いきなり感ある
# Minitestの基本
# FizzBuzzプログラムのテスト自動化

# Minitest
# rubyと一緒にインストールされる
# 学習コスト低い
# Railsのデフォルトテスティングフレームワーク Rails開発するときにも知識を活かしやすい

# テストコードのひな形
# テストコード：クラス名はキャメルケース、ファイル名はスネークケースで書く
require 'miniteset/autorun'

# SampleTestがMinitest::Testを継承
class SampleTest < Minitest::Test # class（7章で説明）
# test_ ではじまるメソッドを探して実行。Minitest
def test_sample
  # 検証メソッド
  # assert_equal 期待する結果, テスト対象となる値や式
  assert_equal 'RUBY', 'ruby'.upcase
  end
end

# aがbと等しければパスする
assert_equal b, a

# aが真であればパスする
assert a

# が偽であればパスする
refute a

# 他
assert_output # 標準出力への出力内容を検証
assert_raises # 指定した例外が発生した時にテストをパス

# sample_test.rbを作って上記入力して保存
####################################
# テスト成功時
####################################
=begin
Run options: --seed 1703

# Running:

. 

Finished in 0.000808s, 1237.6238 runs/s, 1237.6238 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
=end

# Finished in 0.000808s テスト実行にかかった時間
# 1237.6238 runs/s 1秒間に実行できるであろうテストメソッドの件数
# 1237.6238 assertions/s. 1秒間に実行できるであろう検証メソッドの件数

# 1 runs, 実行したテストメソッドの件数
# 1 assertions 実行した検証メソッドの件数
# 0 failures 検証に失敗したテストメソッドの件数
# 0 errors 検証中にエラーが発生したテストメソッドの件数
# 0 skips skipメソッドにより実行をスキップされたテストメソッドの件数

# failuresとerrorsがゼロならテスト成功

####################################
# テスト失敗時
####################################
=begin
Run options: --seed 28437

# Running:

F

Finished in 0.000607s, 1647.4465 runs/s, 1647.4465 assertions/s.

  1) Failure:
SampleTest#test_sample [sample_test.rb:9]:
Expected: "RUBY"
  Actual: "Ruby"

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
=end

# .ではなくFailureのF
# SampleTest#test_sample [sample_test.rb:9]: どこで失敗してるか
# Expected: 期待した結果
# Actual： 実際の結果
# 失敗するとメソッドはそれ以上実行されない

####################################
# テスト実行中にエラー
####################################
=begin
Run options: --seed 29304

# Running:

E

Finished in 0.000630s, 1587.3016 runs/s, 0.0000 assertions/s.

  1) Error:
SampleTest#test_sample:
NoMethodError: undefined method `upcase' for nil:NilClass
    sample_test.rb:9:in `test_sample'

1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
=end

# .ではなくErrorのE
# SNoMethodError: undefined method `upcase' for nil:NilClass nilにはupcaseメソッドは定義されていないエラー
# sample_test.rb:9:in `test_sample' どこでエラー起こったか
