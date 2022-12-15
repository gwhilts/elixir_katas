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
end
