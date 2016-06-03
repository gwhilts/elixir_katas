defmodule RnTest do
  use ExUnit.Case
  doctest Rn

  test "Handles numbers between 1 and 3" do
    assert Rn.romanize(1) == "I"
    assert Rn.romanize(3) == "III"
  end

  test "Handles numbers ending in 4" do
    assert Rn.romanize(4) == "IV"
  end
  
  test "Handles numbers ending in 5" do
    assert Rn.romanize(5) == "V"
  end

  test "Handles numbers between 6 and 8" do
    assert Rn.romanize(6) == "VI"
    assert Rn.romanize(7) == "VII"
    assert Rn.romanize(8) == "VIII"
  end

  test "Handles numbers ending in 9" do
    assert Rn.romanize(9) == "IX"
  end

  test "Handles numbers bewteen 10 and 39" do
    assert Rn.romanize(10) == "X"
    assert Rn.romanize(23) == "XXIII"
    assert Rn.romanize(37) == "XXXVII"
  end

  test "Handles numbers between 40 and 49" do
    assert Rn.romanize(40) == "XL"
    assert Rn.romanize(48) == "XLVIII"
  end

  test "Handles numbers between 50 and 89" do
    assert Rn.romanize(50) == "L"
    assert Rn.romanize(62) == "LXII"
    assert Rn.romanize(89) == "LXXXIX"
  end

  test "Handles numbers between 90 and 99" do
    assert Rn.romanize(92) == "XCII"
    assert Rn.romanize(99) == "XCIX"
  end

  test "Handles numbers between 100 and 399" do
    assert Rn.romanize(202) == "CCII"
  end

  test "Handles numbers between 400 and 499" do
    assert Rn.romanize(428) == "CDXXVIII"
  end

  test "Handles numbers between 500 and 899" do
    assert Rn.romanize(689) == "DCLXXXIX"
  end

  test "Handles numbers between 900 and 999" do
    assert Rn.romanize(927) == "CMXXVII"
  end

  test "Handles numbers greater than 1000" do
    assert Rn.romanize(1033) == "MXXXIII"
    assert Rn.romanize(3724) == "MMMDCCXXIV"
  end

end
