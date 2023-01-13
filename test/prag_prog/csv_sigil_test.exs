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

  describe "~v sigil with 'h' flag" do
    test "returns a keyword list with the header row as keys" do
      given = ~v"""
      State, Capitol, Year
      WA, Olympia, 1889
      OR, Salem
      CA, Sacramento, 1850
      """h

      expected = [
        [State: "WA", Capitol: "Olympia", Year: 1889],
        [State: "OR", Capitol: "Salem"],
        [State: "CA", Capitol: "Sacramento", Year: 1850]
      ]

      assert given == expected
    end
  end
end
