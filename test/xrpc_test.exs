defmodule XRPCTest do
  use ExUnit.Case
  doctest XRPC

  describe "query/3" do
    test "makes a successful request" do
      {:ok, response} =
        XRPC.Client.new("https://bsky.social")
        |> XRPC.query("com.atproto.identity.resolveHandle", params: [handle: "atproto.com"])

      assert response == %{"did" => "did:plc:ewvi7nxzyoun6zhxrhs64oiz"}
    end
  end
end
