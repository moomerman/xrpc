defmodule XRPC.HTTP.Req do
  @moduledoc """
  Req implementation of `XRPC.HTTP` behaviour
  """
  @behaviour XRPC.HTTP

  def get(url, opts) do
    Req.get(url, opts) |> handle_response()
  end

  def post(url, opts) do
    Req.post(url, opts) |> handle_response()
  end

  defp handle_response({:ok, %Req.Response{status: 200} = res}) do
    {:ok, res.body}
  end

  defp handle_response({:ok, %Req.Response{} = res}) do
    {:error, res.body}
  end

  defp handle_response(res) do
    {:boom, res}
  end
end
