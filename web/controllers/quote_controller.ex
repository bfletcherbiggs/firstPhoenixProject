defmodule Splurty.QuoteController do
  use Splurty.Web, :controller

  def index(conn, _params) do
    render conn, "homepage.html"
  end

  def show(conn, %{"messenger" => messenger}) do
    render conn, "show.html", messenger: messenger
  end
end
