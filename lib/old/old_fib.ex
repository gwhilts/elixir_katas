defmodule OldFib do

  def fib(n) when n < 2, do: 0
  def fib(n) when n < 4, do: 1
  def fib(n), do: fib(n-1) + fib(n-2)

  def sum_of_evens_to(limit), do: calc_sum(1, 0, 0, limit)

  defp calc_sum(_, fib_val, sum, limit) when fib_val > limit do
    sum
  end

  defp calc_sum(n, fib_val, sum, limit) do
    case rem fib_val, 2 do
      0 -> calc_sum(n+1, fib(n), sum + fib_val, limit)
      1 -> calc_sum(n+1, fib(n), sum, limit)
    end
  end
end
