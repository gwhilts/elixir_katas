defmodule MyList do

  @spec all?([any], fun) :: boolean
  @doc """
    returns true if any elemements of a list return a truthy value when applied to a given function.
  """
  def all?([], _), do: true
  def all?([h | tail], f), do: f.(h) and all?(tail, f)

  @spec any?([any], fun) :: boolean
  @doc """
    returns true if any elemements of a list return a truthy value when applied to a given function.
  """
  def any?([], _), do: false
  def any?([h | tail], f), do: f.(h) or any?(tail, f)

  @spec each([any], fun) :: :ok
  @doc """
    invokes the given fun for each element in a list.

    ## Examples

    iex> MyList.each(["a", "b", "c"], & IO.puts(String.upcase(&1)))
    A
    B
    C
    :ok
  """
  def each([], _), do: :ok
  def each([h | tail], f) do
    f.(h)
    each(tail, f)
  end

  @spec filter([any], fun) :: [any]
  @doc """
    returns a list of all elements of a list that return a truthy value when applied to a given function.

    ## Exercises

    iex> MyList.filter([1, 2, 3, 4], & rem(&1, 2) == 0)
    [2, 4]
  """
  def filter(list, f), do: filter(list, f, [])
  defp filter([], _, result), do: result
  defp filter([h | tail], f, result) do
    if f.(h) do
      filter(tail, f, (result ++ [h]))
    else
      filter(tail, f, result)
    end
  end

  @spec flatten([any]) :: [any]
  @doc """
    returns a flat list containing all the elements of a given list containing any number of nested sublists.

    ## Examples

    iex> MyList.flatten([1, [2, 3, [4]], 5, [[[6]]]])
    [1, 2, 3, 4, 5, 6]
  """
  def flatten([]), do: []
  def flatten([h | t]), do: flatten(h) ++ flatten(t)
  def flatten(e), do: [e]

  @spec split([any], pos_integer, pos_integer) :: [any]
  @doc """
    returns the elements of a list within a given range

    ## Examples

    iex> MyList.split([1, 2, 3, 4], 1, 2)
    [2, 3]
  """
  def split(list, start, count), do: split(list, start, count, 0, [])
  defp split([], _, _, _, result), do: result
  defp split(_list, start, count, index, result) when index >= start + count, do: result
  defp split([_ | tail], start, count, index, result) when index < start, do: split(tail, start, count, index + 1, result)
  defp split([h | tail], start, count, index, result), do: split(tail, start, count, index + 1, result ++ [h])
end
