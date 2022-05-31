defmodule IpWeb.PageController do
  use IpWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
