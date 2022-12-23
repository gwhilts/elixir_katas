defmodule PragProg.MyStringTest do
  use ExUnit.Case

  alias PragProg.MyString

  doctest PragProg.MyString

  describe "sentence_case/1" do
    test "capitalizes the first word of every sentence in a string" do
      str = "there is a cat. it has a hat. the hat is phat. "
      expected = "There is a cat. It has a hat. The hat is phat. "

      assert MyString.sentence_case(str) == expected
    end

    test "removes capitals not at the beginning of a sentence" do
      str = "oh. a DOG. woof. "
      expected = "Oh. A dog. Woof. "
      assert MyString.sentence_case(str) == expected
    end
  end
end
