defmodule Rn do
  @spec romanize(integer()) :: String.t()
  def romanize(n) when n >= 1000, do: extract(n, 1000, "M")
  def romanize(n) when n >= 900, do: extract(n, 900, "CM")
  def romanize(n) when n >= 500, do: extract(n, 500, "D")
  def romanize(n) when n >= 400, do: extract(n, 400, "CD")
  def romanize(n) when n >= 100, do: extract(n, 100, "C")
  def romanize(n) when n >= 90, do: extract(n, 90, "XC")
  def romanize(n) when n >= 50, do: extract(n, 50, "L")
  def romanize(n) when n >= 40, do: extract(n, 40, "XL")
  def romanize(n) when n >= 10, do: extract(n, 10, "X")
  def romanize(n) when n == 9, do: "IX"
  def romanize(n) when n >= 5, do: extract(n, 5, "V")
  def romanize(n) when n == 4, do: "IV"
  def romanize(n), do: String.duplicate("I", n)


  defp extract(arabic, n, roman) do
    String.duplicate(roman, div(arabic, n)) <> romanize(rem(arabic, n))
  end
end
