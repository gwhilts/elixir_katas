defmodule FizzBuzz do
    def fb(n) do
      case {rem(n, 3), rem(n, 5), n} do
        {0, 0, _} -> "FizzBuzz"
        {0, _, _} -> "Fizz"
        {_, 0, _} -> "Buzz"
        {_, _, n} -> n
      end
    end

    def to(limit) do
      Enum.map 1..limit, fn(n) -> fb(n) end
    end
end
