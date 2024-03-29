defmodule PragProg.MyListTest do
  use ExUnit.Case
  alias PragProg.MyList

  doctest MyList

  def double(n), do: n * 2
  def even?(n), do: rem(n, 2) == 0
  def shout(s), do: IO.puts(String.upcase(s))

  describe "all?/2" do
    test "returns true when the list is empty" do
      # It's weird to me that all?[] is true, but any?[] is false, but that what Enum does
      assert MyList.all?([], &even?/1)
    end

    test "returns true if all elemements of a list return a truthy value when applied to a given function." do
      assert MyList.all?([2, 4, 6], &even?/1)
    end

    test "returns false if any elemement of a list return a non-truthy value when applied to a given function." do
      refute MyList.all?([2, 3, 6], &even?/1)
    end
  end

  describe "any?/2" do
    test "returns false when the list is empty" do
      # It's weird to me that all?[] is true, but any?[] is false, but that what Enum does
      refute MyList.any?([], &even?/1)
    end

    test "returns true if any elemement of a list return a truthy value when applied to a given function." do
      assert MyList.any?([2, 4, 6], &even?/1)
    end

    test "returns false if all elemements of a list return a non-truthy value when applied to a given function." do
      refute MyList.any?([1, 3, 5], &even?/1)
    end
  end

  describe "caesar/2" do
    test "shifts the characters in a given charlist n steps up the alphabet" do
      assert MyList.caesar('abc', 2) == 'cde'
    end

    test "characters shifted beyond 'z' wrap around to the beginning of the alphabet" do
      assert MyList.caesar('xyz', 8) == 'fgh'
    end
  end

  describe "each/2" do
    test "it returns :ok when finished" do
      assert MyList.each([], &shout/1) == :ok
    end

    test "invokes the given fun for each element in a list." do
      # Not sure how to test this. Code below doen't work because it feeds the :ok result to
      # the capture_io/1 function along with the stdout capture.
      # Doctest is passing, but the screen output is annoying.
      # assert capture_io(MyList.each(["a", "b", "c"], & IO.puts(String.upcase(&1)))) == "A\nB\nD\n"
      true
    end
  end

  describe "filter/2" do
    test "returns an empty list when given an empty list" do
      assert MyList.filter([], &even?/1) == []
    end

    test "returns a list of all elements of a list that return a truthy value when applied to a given function." do
      assert MyList.filter([1, 2, 3, 4], &even?/1) == [2, 4]
    end
  end

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
      given = [:a, [:b, :c, [:d]], :e, [[[:f]]]]
      expected = [:a, :b, :c, :d, :e, :f]
      assert expected == MyList.flatten(given)
    end
  end

  describe "mapsum/2" do
    test "applies a function to the given list and returns the sum of all the results" do
      assert MyList.mapsum([1, 3, 5], &double/1) == 18
    end
  end

  describe "max/1" do
    test "returns the largest value of a list" do
      assert MyList.max([2, 4, 88, 1]) == 88
    end
  end

  describe "span/2" do
    test "returns a list of the numbers from from one integer up to another." do
      assert MyList.span(3, 7) == [3, 4, 5, 6, 7]
      assert MyList.span(?s, ?u) == 'stu'
    end
  end

  describe "split/3" do
    test "returns an empty list when given an empty list" do
      assert MyList.split([], 2, 2) == []
    end

    test "returns the elements of a list within a given range." do
      assert MyList.split([1, 2, 3, 4], 1, 2) == [2, 3]
    end

    test "ignores start values that are out of range" do
      assert MyList.split([1, 2, 3, 4], 10, 1) == []
    end

    test "when the range extends past the length of the list it returns only the elements up to the end" do
      assert MyList.split([1, 2, 3], 1, 10) == [2, 3]
    end
  end

  describe "take/2" do
    test "returns the first n number of elements in a list." do
      assert MyList.take([1, 2, 3, 4], 2) == [1, 2]
    end

    test "when the count exceeds the length of the list, it returns the only the elements up to the end" do
      assert MyList.take([1, 2, 3, 4], 10) == [1, 2, 3, 4]
    end
  end
end
