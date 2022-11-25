defmodule ThreesAndFivesTest do
  use ExUnit.Case
  doctest ThreesAndFives

  describe "sum_of_multiples_to/1" do
    test "adds the multiples of 3 and 5" do
      # 3 + 5 + 6 + 9 = 23
      assert ThreesAndFives.sum_of_multiples_to(9) == 23

      # 3 + 5 + 6 + 9 + 10 + 12 + 15 =
      assert ThreesAndFives.sum_of_multiples_to(15) == 60
    end
  end
end
