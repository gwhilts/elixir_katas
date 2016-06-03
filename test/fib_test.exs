defmodule FibTest do
  use ExUnit.Case
  doctest Fib

  test "it calculates the n-th number in the fibonacci sequence" do
    assert Fib.fib(3) == 3
    assert Fib.fib(8) == 34
  end

  test "it calculates the sum of the even fibonacci numbers" do
    assert Fib.sum_of_evens_to(34) == 44
    assert Fib.sum_of_evens_to(90) == 188
  end
end
