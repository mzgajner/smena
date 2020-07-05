# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Smena.Repo.insert!(%Smena.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

mato = Smena.Repo.insert!(%Smena.Users.User{name: "Mato"})

Smena.Repo.insert!(%Smena.Punches.Punch{user: mato, in: true})
Smena.Repo.insert!(%Smena.Punches.Punch{user: mato, in: false})
