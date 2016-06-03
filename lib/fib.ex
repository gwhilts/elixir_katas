defmodule Fib do

  def fib(0), do: 1
  def fib(1), do: 1
  def fib(n), do: fib(n-1) + fib(n-2)

  def sum_of_evens_to(limit) do
    Enum.reduce_while(1..1_000_000, 0, fn n, sum ->        
     f = fib(n)
     new_sum = 
       case rem(f, 2) do
         0 -> sum + f
         1 -> sum
       end
     if f <= limit, do: {:cont, new_sum}, else: {:halt, new_sum}
    end) 
  end
end
