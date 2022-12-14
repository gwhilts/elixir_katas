defmodule MyList do

  @spec flatten([any]) :: [any]
  @doc """
    returns a flat list containing all the elements of a given list containing any number of nested sublists.

     ## Examples

    ​iex>​ MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])​ 
    [1,2,3,4,5,6]
  """
  def flatten([]), do: []
  def flatten(list), do: :implement_me
end
