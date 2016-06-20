defmodule FizzBuzzTest do
  use ExUnit.Case
  doctest FizzBuzz

  test "it returns 'Fizz' on mulitples of 3" do
    assert FizzBuzz.fb(3)  == "Fizz"
    assert FizzBuzz.fb(18) == "Fizz"
  end

  test "it returns 'Buzz' for multiples of 5" do
    assert FizzBuzz.fb(5)  == "Buzz"
    assert FizzBuzz.fb(40) == "Buzz"
  end

  test "it returns 'FizzBuzz' for multiples of both 5 and 3" do
    assert FizzBuzz.fb(15) == "FizzBuzz"
    assert FizzBuzz.fb(60) == "FizzBuzz"
  end

  test "it returns the FizzBuzz sequence up to a given limit" do
    assert FizzBuzz.to(16) == [1,
                              2,
                              "Fizz",
                              4,
                              "Buzz",
                              "Fizz",
                              7,
                              8,
                              "Fizz",
                              "Buzz",
                              11,
                              "Fizz",
                              13,
                              14,
                              "FizzBuzz",
                              16]
  end

end
