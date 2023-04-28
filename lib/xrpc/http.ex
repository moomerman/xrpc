defmodule XRPC.HTTP do
  @moduledoc """
  `XRPC.HTTP` behaviour definition
  """
  @callback get(binary, keyword) :: {:ok, map} | {:error, map}
  @callback post(binary, keyword) :: {:ok, map} | {:error, map}
end
