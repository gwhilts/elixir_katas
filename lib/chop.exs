defmodule Chop do

  def guess(actual, range = low..high) do
    g = div(low + high, 2)
    IO.puts "Is it #{ g }?"
    _guess(g, actual, range)
  end

  def _guess(actual, actual, _) do
    IO.puts "#{ actual }"
  end

  def _guess(g, actual, _low..high) when g < actual do
    guess actual, (g+1)..high
  end

  def _guess(g, actual, low.._high) when g > actual do
    guess actual, low..(g-1)
  end

end
