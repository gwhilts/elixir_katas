defmodule PragProg.MyString do
  @doc """
    prints a given list of words centered in a column
  """
    ## Examples

    # iex> PragProg.MyString.center([​"​​cat"​, ​"​​zebra"​, ​"​​elephant"​])
    #   cat
    #  zebra
    # elephant

    # iex> PragProg.MyString.center(["Seattle", "Los Angeles", "New York", "Miami"])
    #   Seattle
    # Los Angeles
    #  New York
    #    Miami
  @spec center([String.t()]) :: :ok
  def center(words) do
    width = Enum.map(words, &String.length/1) |> Enum.max()
    Enum.each(words, fn w -> IO.puts _padding(w, width) <> w end)
  end

  defp _padding(word, width) do
    String.duplicate(" ", div(width - String.length(word), 2))
  end
end
