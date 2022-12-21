defmodule PragProg.OrdersTest do
  use ExUnit.Case

  alias PragProg.Orders

  doctest Orders

  describe "calc_totals/1" do
    test "returns an empty list if no orders are given" do
      tax_rates = [NC: 0.075, TX: 0.08]
      assert Orders.calc_totals([], tax_rates) == []
    end

    test "applies the tax rate correctly for one state" do
      orders = [[id: 123, ship_to: :NC, net_amount: 100.00 ]]
      tax_rates = [NC: 0.075]
      expected = [[id: 123, ship_to: :NC, net_amount: 100.00, total_amount: 107.50]]

      assert Orders.calc_totals(orders, tax_rates) == expected
    end

    test "does not add tax to orders in states without specified tax rates" do
      orders = [[id: 123, ship_to: :NC, net_amount: 100.00 ]]
      tax_rates = [TX: 0.08]
      expected = [[id: 123, ship_to: :NC, net_amount: 100.00, total_amount: 100.00]]
    end

    test "applies the tax rates correctly for multiple states" do
      tax_rates = [NC: 0.075, TX: 0.08]
      orders = [[ id: 123, ship_to: :NC, net_amount: 100.00 ],
                [ id: 124, ship_to: :OK, net_amount:  35.50 ],
                [ id: 125, ship_to: :TX, net_amount:  24.00 ],
                [ id: 126, ship_to: :TX, net_amount:  44.80 ],
                [ id: 127, ship_to: :NC, net_amount:  25.00 ],
                [ id: 128, ship_to: :MA, net_amount:  10.00 ],
                [ id: 129, ship_to: :CA, net_amount: 102.00 ],
                [ id: 130, ship_to: :NC, net_amount:  50.00 ]]
      expected = [[ id: 123, ship_to: :NC, net_amount: 100.00, total_amount: 107.50],
                  [ id: 124, ship_to: :OK, net_amount:  35.50, total_amount:  35.50],
                  [ id: 125, ship_to: :TX, net_amount:  24.00, total_amount:  25.92],
                  [ id: 126, ship_to: :TX, net_amount:  44.80, total_amount:  48.38],
                  [ id: 127, ship_to: :NC, net_amount:  25.00, total_amount:  26.88],
                  [ id: 128, ship_to: :MA, net_amount:  10.00, total_amount:  10.00],
                  [ id: 129, ship_to: :CA, net_amount: 102.00, total_amount: 102.00],
                  [ id: 130, ship_to: :NC, net_amount:  50.00, total_amount:  53.75]]

      assert Orders.calc_totals(orders, tax_rates) == expected
    end
  end
end
