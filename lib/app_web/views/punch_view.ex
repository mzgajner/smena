defmodule SmenaWeb.PunchView do
  use SmenaWeb, :view

  def render("index.json", %{punches: punches}) do
    %{data: render_many(punches, SmenaWeb.PunchView, "punch.json")}
  end

  def render("show.json", %{punch: punch}) do
    %{data: render_one(punch, SmenaWeb.PunchView, "punch.json")}
  end

  def render("punch.json", %{punch: punch}) do
    %{
      in: punch.in,
      time: punch.inserted_at
    }
  end

end
