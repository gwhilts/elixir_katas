defmodule PragProg do
  def calc_totals([], _), do: []
  def calc_totals(orders, tax_rates) do
    Enum.map(orders, fn order -> add_tax(order, tax_rates) end)
  end

  defp add_tax(order, tax_rates) do
    sales_tax = (tax_rates[order[:ship_to]] || 0) * order[:net_amount]
    order ++ [total_amount: Float.round(order[:net_amount] + sales_tax, 2)]
  end
end
