defmodule XRPC do
  @moduledoc """
  `XRPC` client implementation (https://atproto.com/specs/xrpc)
  """
  @http_client XRPC.HTTP.Req

  def query(client, id, opts \\ []) do
    opts = put_auth_header(opts, client.access_token)
    get(url(client.host, id), opts)
  end

  def procedure(client, id, opts \\ []) do
    opts =
      opts
      |> put_auth_header(client.access_token)
      |> put_content_type_header()

    post(url(client.host, id), opts)
  end

  defp url(service, id), do: "#{service}" <> "/xrpc" <> "/#{id}"

  defp get(url, opts), do: @http_client.get(url, opts)
  defp post(url, opts), do: @http_client.post(url, opts)

  defp put_auth_header(opts, access_token) do
    put_headers(opts, authorization: "Bearer #{access_token}")
  end

  defp put_content_type_header(opts) do
    put_headers(opts, content_type: "application/json")
  end

  defp put_headers(opts, headers) do
    opts
    |> Keyword.put_new(:headers, [])
    |> Keyword.update(:headers, [], &Keyword.merge(&1, headers))
  end
end
