defmodule RnKataTest do
  use ExUnit.Case
  doctest RnKata

  test "Handles numbers between 1 and 3" do
    assert RnKata.romanize(1) == "I"
    assert RnKata.romanize(3) == "III"
  end

  test "Handles numbers ending in 4" do
    assert RnKata.romanize(4) == "IV"
  end
  
  test "Handles numbers ending in 5" do
    assert RnKata.romanize(5) == "V"
  end

  test "Handles numbers between 6 and 8" do
    assert RnKata.romanize(6) == "VI"
    assert RnKata.romanize(7) == "VII"
    assert RnKata.romanize(8) == "VIII"
  end

  test "Handles numbers ending in 9" do
    assert RnKata.romanize(9) == "IX"
  end

  test "Handles numbers bewteen 10 and 39" do
    assert RnKata.romanize(10) == "X"
    assert RnKata.romanize(23) == "XXIII"
    assert RnKata.romanize(37) == "XXXVII"
  end

  test "Handles numbers between 40 and 49" do
    assert RnKata.romanize(40) == "XL"
    assert RnKata.romanize(48) == "XLVIII"
  end

  test "Handles numbers between 50 and 89" do
    assert RnKata.romanize(50) == "L"
    assert RnKata.romanize(62) == "LXII"
    assert RnKata.romanize(89) == "LXXXIX"
  end

  test "Handles numbers between 90 and 99" do
    assert RnKata.romanize(92) == "XCII"
    assert RnKata.romanize(99) == "XCIX"
  end

  test "Handles numbers between 100 and 399" do
    assert RnKata.romanize(202) == "CCII"
  end

  test "Handles numbers between 400 and 499" do
    assert RnKata.romanize(428) == "CDXXVIII"
  end

  test "Handles numbers between 500 and 899" do
    assert RnKata.romanize(689) == "DCLXXXIX"
  end

  test "Handles numbers between 900 and 999" do
    assert RnKata.romanize(927) == "CMXXVII"
  end

  test "Handles numbers greater than 1000" do
    assert RnKata.romanize(1033) == "MXXXIII"
    assert RnKata.romanize(3724) == "MMMDCCXXIV"
  end

end
