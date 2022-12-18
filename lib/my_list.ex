defmodule MyList do

  @doc """
  returns true if any elemements of a list return a truthy value when applied to a given function.
  """
  @spec all?([any], fun) :: boolean
  def all?([], _), do: true
  def all?([h | tail], f), do: f.(h) and all?(tail, f)

  @doc """
  returns true if any elemements of a list return a truthy value when applied to a given function.
  """
  @spec any?([any], fun) :: boolean
  def any?([], _), do: false
  def any?([h | tail], f), do: f.(h) or any?(tail, f)

  @doc """
  shifts the characters in a given charlist n steps up the alphabet

  ## Examples:

  iex> MyList.caesar('ryvkve', 13)
  'elixir'
  """
  @spec caesar(charlist, pos_integer) :: charlist
  def caesar(chars, n) do
    Enum.map(chars, &(if (&1 + n > ?z), do: &1 + n - 26, else: &1 + n))
  end

  @doc """
  invokes the given fun for each element in a list.

  ## Examples

  iex> MyList.each(["a", "b", "c"], & IO.puts(String.upcase(&1)))
  A
  B
  C
  :ok
  """
  @spec each([any], fun) :: :ok
  def each([], _), do: :ok
  def each([h | tail], f) do
    f.(h)
    each(tail, f)
  end

  @doc """
  returns a list of all elements of a list that return a truthy value when applied to a given function.

  ## Examples

  iex> MyList.filter([1, 2, 3, 4], & rem(&1, 2) == 0)
  [2, 4]
  """
  @spec filter([any], fun) :: [any]
  def filter(list, f), do: filter(list, f, [])
  defp filter([], _, result), do: result
  defp filter([h | tail], f, result) do
    if f.(h) do
      filter(tail, f, (result ++ [h]))
    else
      filter(tail, f, result)
    end
  end

  @doc """
  returns a flat list containing all the elements of a given list containing any number of nested sublists.

  ## Examples

  iex> MyList.flatten([1, [2, 3, [4]], 5, [[[6]]]])
  [1, 2, 3, 4, 5, 6]
  """
  @spec flatten([any]) :: [any]
  def flatten([]), do: []
  def flatten([h | t]), do: flatten(h) ++ flatten(t)
  def flatten(e), do: [e]

  @spec mapsum([integer], fun) :: integer
  def mapsum(list, f) do
    # cheating 1: Enum.reduce(list, 0, & f.(&1) + &2)
    # cheating 2: Enum.map(list, f) |> Enum.sum()
    mapsum(list, f, 0)
  end
  defp mapsum([], _, sum), do: sum
  defp mapsum([h | tail], f, sum), do: mapsum(tail, f, sum + f.(h))

  @spec max([integer]) :: integer
  def max([h | tail]), do: maximum(tail, h)
  defp maximum([], n), do: n
  defp maximum([h | tail], n), do: if h > n, do: maximum(tail, h), else: maximum(tail, n)

  @doc """
  returns a list of the numbers from from one integer up to another

  i.e. emulates behavior of Enum.to_list(from..to) for positive
  integers of increasing value

  ## Examples

  iex> MyList.span(13, 17)
  [13, 14, 15, 16, 17]
  """
  @spec span(integer, integer) :: [integer]
  def span(start, stop), do: span([], start, stop)
  defp span(list, n, stop) when n > stop, do: list
  defp span(list, n, stop), do: span(list ++ [n], n + 1, stop)

  @doc """
  returns the elements of a list within a given range

  ## Examples

  iex> MyList.split([1, 2, 3, 4], 1, 2)
  [2, 3]
  """
  @spec split([any], pos_integer, pos_integer) :: [any]
  def split(list, start, count), do: split(list, start, count, 0, [])
  defp split([], _, _, _, result), do: result
  defp split(_, start, count, index, result) when index >= start + count, do: result
  defp split([_ | tail], start, count, index, result) when index < start, do: split(tail, start, count, index + 1, result)
  defp split([h | tail], start, count, index, result), do: split(tail, start, count, index + 1, result ++ [h])

  @spec take([any], pos_integer) :: [any]
    @doc """
      returns the first n number of a given list

      ## Examples

      iex> MyList.take([1, 2, 3, 4], 2)
      [1, 2]
    """
  def take(list, count), do: take(list, count, 0, [])
  defp take([], _, _, result), do: result
  defp take(_, count, index, result) when index >= count, do: result
  defp take([h | tail], count, index, result), do: take(tail, count, index + 1, result ++ [h])
end
