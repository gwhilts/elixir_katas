defmodule OldThreesAndFives do
  def sum_of_multiples_to(limit) do
    Enum.reduce 3..limit, 0, fn(n, sum) ->
      if rem(n, 3) == 0 || rem(n, 5) == 0 do
        sum + n
      else
        sum
      end
    end
  end
end
