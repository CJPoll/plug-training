defmodule PlugTraining.ModulePlug.Test do
  use ExUnit.Case
  use Plug.Test

  alias Plug.Conn

  @test_module PlugTraining.ModulePlug

  setup do
    conn = conn(:get, "/hello")

    {:ok, %{conn: conn}}
  end

  @tag :skip
  test "defines an init/1 function" do
    assert function_exported?(PlugTraining.FunctionPlug, :init, 1)
  end

  @tag :skip
  test "defines a call/2 function" do
    assert function_exported?(PlugTraining.FunctionPlug, :call, 2)
  end

  describe "init/1" do
    @tag :skip
    test "for this example, the argument must be an empty list" do
      # Does not raise
      @test_module.init([])
      assert_raise FunctionClauseError, fn -> @test_module.init([:hello]) end
    end

    @tag :skip
    test "for this example, return [called_init: true]" do
      assert [called_init: true] = @test_module.init([])
    end
  end

  describe "call/2" do
    @tag :skip
    test "the first argument must be a Plug.Conn" do
      assert_raise FunctionClauseError, fn -> @test_module.call(:not_a_conn, %{}) end
    end

    @tag :skip
    test "the second argument should generally be the return value of init/1", %{conn: conn} do
      @test_module.call(conn, @test_module.init([]))
    end

    @tag :skip
    test "the function must return a conn", %{conn: conn} do
      assert %Conn{} = @test_module.call(conn, %{})
    end
  end
end
