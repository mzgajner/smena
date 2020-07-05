defmodule SmenaWeb.IndexController do
  use SmenaWeb, :controller

  def self(conn, _params) do
    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> Plug.Conn.send_file(200, "priv/static/index.html")
  end
end
