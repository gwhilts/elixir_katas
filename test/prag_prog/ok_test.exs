defmodule PragProg.OkTest do
  use ExUnit.Case

  alias PragProg.Ok

  describe "ok!/1" do
    test "when the argument is {:ok, data}, it returns the data" do
      assert Ok.ok!({:ok, "test string"}) == "test string"
      assert Ok.ok!({:ok, :test_atom}) == :test_atom
    end

    test "when the argument does not match {:ok, data}, it raises an error" do
      assert_raise RuntimeError, fn ->
        Ok.ok!("Not ok")
      end

      assert_raise RuntimeError, fn ->
        Ok.ok!({:error, "Sorry, dude."})
      end
    end
  end
end
