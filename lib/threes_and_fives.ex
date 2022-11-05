defmodule ThreesAndFives do

  # returns sum of all positive multiples of
  # three or five up to the max
  @spec sum_of_multiples_to(integer) :: integer
  def sum_of_multiples_to(max) do
    0..max
    |> Enum.filter(fn n -> rem(n, 3) == 0 || rem(n, 5) == 0 end)
    |> Enum.sum
  end
end
