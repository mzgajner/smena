defmodule SmenaWeb.PunchController do
  use SmenaWeb, :controller

  alias Smena.Punches
  alias Smena.Punches.Punch
  alias Smena.Users
  alias Smena.Users.User

  def index(conn, _params) do
    punches = Punches.list_punches()
    render(conn, "index.json", punches: punches)
  end

  def create(conn, request_params) do
    name = request_params["user"]
    user = Users.get_user_by_name(name)
    latest_punch = Punches.get_latest_punch()
    new_punch_state = !latest_punch.in

    punch_params = %{"user" => user, "in" => new_punch_state}

    with {:ok, %Punch{} = punch} <- Punches.create_punch(punch_params) do
      conn
      |> put_status(:created)
      |> render("show.json", punch: punch)
    end
  end
end
