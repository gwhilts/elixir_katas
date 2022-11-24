defmodule Fib do

  # Return a list of the first 'n' numbers in the Fib sequence
  @spec sequence_of(integer) :: list
  def sequence_of(n), do: stream() |> Enum.take(n)

  # Return the nth number of the Fib sequence
  @spec element(integer) :: integer
  def element(n), do: stream() |> Enum.at(n-1)

  # Return the sum of the even numbers in the fib sequence up to the given limit
  @spec sum_of_evens_to(integer) :: integer
  def sum_of_evens_to(limit) do
    stream()
    |> Enum.reduce_while(0, fn n, sum ->
      cond do
        n > limit      -> {:halt, sum}
        rem(n, 2) == 0 -> {:cont, sum + n}
        true           -> {:cont, sum}
      end
    end)
  end

  defp stream, do: Stream.unfold({0, 1}, fn {current, next} -> {current, {next, current + next}} end)

end
