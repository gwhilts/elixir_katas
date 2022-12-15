defmodule MyListTest do
  use ExUnit.Case
  doctest MyList

  describe "flatten/1" do
    test "returns an empty list when given an empty list" do
      assert MyList.flatten([]) == []
    end

    test "returns the same list when given a flat list" do
      expected = [:a, :b, :c]
      assert expected == MyList.flatten(expected)
    end

    test "returns a flat list containing all the elements of a given list containing one sublist." do
      given = [:a, [:b, :c]]
      expected = [:a, :b, :c]
      assert expected == MyList.flatten(given)
    end

    test "returns a flat list containing all the elements of a given list containing multiple sublists." do
      given = [[:a, :b], [:c]]
      expected = [:a, :b, :c]
      assert expected == MyList.flatten(given)
    end

    test "returns a flat list containing all the elements of a given list with sublists nested 2 deep." do
      given = [:a, [:b, [:c, :d], :e]]
      expected = [:a, :b, :c, :d, :e]
      assert expected == MyList.flatten(given)
    end

    test "returns a flat list containing all the elements of a given list containing any number of nested sublists." do
      given = [ :a, [ :b, :c, [:d] ], :e, [[[:f]]]]
      expected = [:a, :b, :c, :d, :e, :f]
      assert expected == MyList.flatten(given)
    end
  end

  describe "all?/2" do
    @tag :pending
    test "returns true if all elemements of a list return a truthy value when applied to a given function." do
      false
    end
  end

  describe "each?/2" do
    @tag :pending
    test "invokes the given fun for each element in a list.." do
      false
    end
  end

  describe "filter/2" do
    @tag :pending
    test "returns a list of all elements of a list that return a truthy value when applied to a given function." do
      false
    end
  end

  describe "split/3" do
    @tag :pending
    test "returns the elements of a list within a given range." do
      false
    end
  end

  describe "take/2" do
    @tag :pending
    test "returns the first n number of elements in a list." do
      false
    end
  end
end
