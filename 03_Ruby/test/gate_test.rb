require 'minitest/autorun'
require './lib/gate'
require './lib/ticket'

class GateTest < Minitest::Test
  def test_gate
    # とりあえずGateオブジェクトが作られうことを確認する
    # assert Gate.new #=> OK
    umeda = Gate.new(:umeda)
    juso = Gate.new(:juso)
    ticket = Ticket.new(150)
    umeda.enter(ticket)
    assert juso.exit(ticket)
  end
end