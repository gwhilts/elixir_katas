defmodule OldRn do
  def romanize(arabic) when arabic >= 1000, do: extract(arabic, 1000, "M")
  def romanize(arabic) when arabic >= 900, do: extract(arabic, 900, "CM")
  def romanize(arabic) when arabic >= 500, do: extract(arabic, 500, "D")
  def romanize(arabic) when arabic >= 400, do: extract(arabic, 400, "CD")
  def romanize(arabic) when arabic >= 100, do: extract(arabic, 100, "C")
  def romanize(arabic) when arabic >= 90, do: extract(arabic, 90, "XC")
  def romanize(arabic) when arabic >= 50, do: extract(arabic, 50, "L")
  def romanize(arabic) when arabic >= 40, do: extract(arabic, 40, "XL")
  def romanize(arabic) when arabic >= 10, do: extract(arabic, 10, "X")
  def romanize(9), do: "IX"
  def romanize(arabic) when arabic >= 5, do: extract(arabic, 5, "V")
  def romanize(4), do: "IV"
  def romanize(arabic), do: String.duplicate("I", arabic)

  defp extract(arabic, n, roman) do
    String.duplicate(roman, div(arabic, n)) <> romanize(rem(arabic, n))
  end
end
