defmodule PragProg.Ok do
  @doc """
    Exercise: ControlFlow-3 from Programming Elixir, by Dave Thomas

    “Write an ok! function that takes an arbitrary parameter. If the parameter
    is the tuple {:ok, data}, return the data. Otherwise, raise an
    exception containing information from the parameter.”
  """
  def ok!({:ok, data}), do: data
  def ok!(_), do: raise RuntimeError
end
