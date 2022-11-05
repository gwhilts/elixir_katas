defmodule FibTest do
  use ExUnit.Case
  doctest Fib

  test "it calculates the n-th number in the fibonacci sequence" do
    # 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233
    assert Fib.element(4)  == 2
    assert Fib.element(10) == 34
  end

  test "it calculates the sum of the even fibonacci numbers" do
    # _, _, _, 2, _, _, 8, _, _, 34, _, _
    # 2 + 8 + 34
    # 44
    assert Fib.sum_of_evens_to(10) == 10
    assert Fib.sum_of_evens_to(90) == 44
  end
end
