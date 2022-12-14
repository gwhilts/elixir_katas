defmodule MyListTest do
  use ExUnit.Case
  doctest MyList

  describe "flatten/1" do
    test " returns an empty list when given an empty list" do
      assert MyList.flatten([]) == []
    end

    test " returns the same list when given a flat list" do
      expected = [:a, :b, :c]
      assert expected == MyList.flatten(expected)
    end

    test " returns a flat list containing all the elements of a given list containing one sublist." do
      given = [:a, [:b, :c]]
      expected = [:a, :b, :c]
      assert expected == MyList.flatten(given)
    end

    @tag :pending
    test " returns a flat list containing all the elements of a given list containing multiple sublists." do
      given = [[:a, :b], [:c]]
      expected = [:a, :b, :c]
      assert expected == MyList.flatten(given)
    end

    @tag :pending
    test " returns a flat list containing all the elements of a given list with sublists nested 2 deep." do
      given = [:a, [:b, [:c, :d], :e]]
      expected = [:a, :b, :c, :d, :e]
      assert expected == MyList.flatten(given)
    end

    @tag :pending
    test " returns a flat list containing all the elements of a given list containing any number of nested sublists." do
      given = [ :a, [ :b, :c, [:d] ], :e, [[[:f]]]]
      expected = [:a, :b, :c, :d, :e, :f]
      assert expected == MyList.flatten(given)
    end
  end
end
