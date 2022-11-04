defmodule FizzBuzz do

  @spec to(integer) :: list
  def to(limit) do
    Enum.map 1..limit, &fb/1
  end

  @spec fb(integer) :: String | integer
  def fb(n) do
    case {rem(n, 3), rem(n, 5)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      _ -> n
    end
  end

end
