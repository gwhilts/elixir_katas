defmodule PragProg.CSVSigil do
  @spec sigil_v(binary, charlist) :: [list]
  def sigil_v(csv, 'h') do
    [h_row | lines] = String.split(csv, "\n", trim: true)
    headers = parse_line(h_row) |> Enum.map(&String.to_atom/1)
    Enum.map(lines, &Enum.zip(headers, parse_line(&1)))
  end

  def sigil_v(csv, _) do
    csv
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(line), do: String.split(line, ",", trim: true) |> Enum.map(&cast_float(String.trim(&1)))

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
