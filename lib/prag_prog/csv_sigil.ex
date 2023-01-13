defmodule PragProg.CSVSigil do
  def sigil_v(csv, []) do
    csv
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(line),
    do: String.split(line, ",", trim: true) |> Enum.map(&cast_float(String.trim(&1)))

  defp cast_float(e) do
    case Float.parse(e) do
      :error -> e
      {f, _} -> f
    end
  end

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [sigil_v: 2]
      import unquote(__MODULE__), only: [sigil_v: 2]
    end
  end
end
