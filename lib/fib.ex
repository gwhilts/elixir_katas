defmodule Fib do

  # returns the nth element of the Fib sequence
  # elegent for finding the nth element but
  # not an efficient way to build a list of the
  # sequeence. Calculting each element would
  # require building the entire sequence over
  # and over again, nearly n^2 * 3 times
  @spec element(integer) :: integer
  def element(n) when n < 2, do: 0
  def element(n) when n < 4, do: 1
  def element(n), do: element(n-2) + element(n-1)

  # returns a list of the first n numbers in the Fib sequence
  @spec sequence_of(integer) :: list
  def sequence_of(size) do
    build_seq([], size)
  end

  # given an integer n,
  # returns a list of the Fib sequence up to n
  @spec sequence_to(integer) :: list
  def sequence_to(n) do
    build_seq_to(n, [])
  end

  # given a limit, an empty list or valid Fib sequence
  # returns a list of the Fib sequence who's last element
  # is no greater than the limit
  @spec build_seq_to(integer, list) :: String | list
  def build_seq_to(limit, seq) do
    # next_val = 13
    next_val = next(seq)
    if next_val <= limit do
      build_seq_to(limit, [next_val | seq ])
    else
      Enum.reverse seq
    end
  end

  # koan: return the sum of the even
  # fib values up to a given limit
  @spec sum_of_evens_to(integer) :: integer
  def sum_of_evens_to(limit) do
    build_seq_to(limit, [])
    |> Enum.filter(fn e -> rem(e, 2) == 0 end)
    |> Enum.sum
  end

# Private methods

  # builds a fib sequence of the first n elements
  # seq must be an empty list or a valid sequence
  # the list must be reversed before return
  defp build_seq(seq, n) do
    if Enum.count(seq) >= n do
      Enum.reverse seq
    else
      build_seq([next(seq) | seq], n)
    end
  end

  # Given an empty list or valid fib sequence,
  # returns the next element
  defp next(seq) do
    case Enum.count(seq) do
      0 -> 0
      1 -> 1
      2 -> 1
      _ -> sum_of_first_two(seq)
    end
  end

  # Returns the sum of the first two elements of a list
  defp sum_of_first_two(seq) do
    [a, b | _] = seq
    a + b
  end

end
