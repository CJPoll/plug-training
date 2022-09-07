defmodule PlugTraining.FunctionPlug.Test do
  use ExUnit.Case
  use Plug.Test

  alias Plug.Conn

  @test_module PlugTraining.FunctionPlug

  setup do
    conn = conn(:get, "/hello")

    {:ok, %{conn: conn}}
  end

  describe "handle_request/2" do
    @tag :skip
    test "defines a handle_request/2 function" do
      assert function_exported?(PlugTraining.FunctionPlug, :handle_request, 2)
    end

    @tag :skip
    test "the first argument must be a Plug.Conn" do
      assert_raise FunctionClauseError, fn -> @test_module.handle_request(:not_a_conn, %{}) end
    end

    @tag :skip
    test "the function must return a conn", %{conn: conn} do
      assert %Conn{} = @test_module.handle_request(conn, %{})
    end
  end
end
