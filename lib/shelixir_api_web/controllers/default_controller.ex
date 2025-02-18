defmodule ShelixirApiWeb.DefaultController do
  use ShelixirApiWeb, :controller

  def index(conn, _params) do
    text conn, "See you in church tomorrow! -your fav Elixir #{Mix.env()}"
  end
end
