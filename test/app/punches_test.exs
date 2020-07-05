defmodule Smena.PunchesTest do
  use Smena.DataCase

  alias Smena.Punches

  describe "punches" do
    alias Smena.Punches.Punch

    @valid_attrs %{in: true}
    @update_attrs %{in: false}
    @invalid_attrs %{in: nil}

    def punch_fixture(attrs \\ %{}) do
      {:ok, punch} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Punches.create_punch()

      punch
    end

    test "list_punches/0 returns all punches" do
      punch = punch_fixture()
      assert Punches.list_punches() == [punch]
    end

    test "get_punch!/1 returns the punch with given id" do
      punch = punch_fixture()
      assert Punches.get_punch!(punch.id) == punch
    end

    test "create_punch/1 with valid data creates a punch" do
      assert {:ok, %Punch{} = punch} = Punches.create_punch(@valid_attrs)
      assert punch.in == true
    end

    test "create_punch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Punches.create_punch(@invalid_attrs)
    end

    test "update_punch/2 with valid data updates the punch" do
      punch = punch_fixture()
      assert {:ok, %Punch{} = punch} = Punches.update_punch(punch, @update_attrs)
      assert punch.in == false
    end

    test "update_punch/2 with invalid data returns error changeset" do
      punch = punch_fixture()
      assert {:error, %Ecto.Changeset{}} = Punches.update_punch(punch, @invalid_attrs)
      assert punch == Punches.get_punch!(punch.id)
    end

    test "delete_punch/1 deletes the punch" do
      punch = punch_fixture()
      assert {:ok, %Punch{}} = Punches.delete_punch(punch)
      assert_raise Ecto.NoResultsError, fn -> Punches.get_punch!(punch.id) end
    end

    test "change_punch/1 returns a punch changeset" do
      punch = punch_fixture()
      assert %Ecto.Changeset{} = Punches.change_punch(punch)
    end
  end
end
