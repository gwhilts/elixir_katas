defmodule PragProg.CSVSigilTest do
  use ExUnit.Case
  use PragProg.CSVSigil

  describe "~v sigil" do
    test "returns a nested list of a CSV string" do
      given = ~v"""
      WA, Olympia
      OR, Salem
      CA, Sacramento
      """

      expected = [
        ["WA", "Olympia"],
        ["OR", "Salem"],
        ["CA", "Sacramento"]
      ]

      assert given == expected
    end

    test "returns numbers as floats" do
      given = ~v"""
      Joe, Schmoe, 23
      Mary, Contrary, 34
      Swee, Pea, 2.5
      """

      expected = [
        ["Joe", "Schmoe", 23.0],
        ["Mary", "Contrary", 34.0],
        ["Swee", "Pea", 2.5]
      ]

      assert given == expected
    end
  end
end
