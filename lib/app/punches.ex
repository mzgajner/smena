defmodule Smena.Punches do
  @moduledoc """
  The Punches context.
  """

  import Ecto.Query, warn: false
  alias Smena.Repo

  alias Smena.Punches.Punch

  @doc """
  Returns the list of punches.

  ## Examples

      iex> list_punches()
      [%Punch{}, ...]

  """
  def list_punches do
    Repo.all(Punch)
  end

  @doc """
  Gets a single punch.

  Raises `Ecto.NoResultsError` if the Punch does not exist.

  ## Examples

      iex> get_punch!(123)
      %Punch{}

      iex> get_punch!(456)
      ** (Ecto.NoResultsError)

  """
  def get_punch!(id), do: Repo.get!(Punch, id)

  @doc """
  Gets latest punch.

  """
  def get_latest_punch() do
    Repo.one(from x in Punch, order_by: [desc: x.id], limit: 1)
  end

  @doc """
  Creates a punch.

  ## Examples

      iex> create_punch(%{field: value})
      {:ok, %Punch{}}

      iex> create_punch(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_punch(attrs \\ %{}) do
    %Punch{}
    |> Punch.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a punch.

  ## Examples

      iex> update_punch(punch, %{field: new_value})
      {:ok, %Punch{}}

      iex> update_punch(punch, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_punch(%Punch{} = punch, attrs) do
    punch
    |> Punch.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a punch.

  ## Examples

      iex> delete_punch(punch)
      {:ok, %Punch{}}

      iex> delete_punch(punch)
      {:error, %Ecto.Changeset{}}

  """
  def delete_punch(%Punch{} = punch) do
    Repo.delete(punch)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking punch changes.

  ## Examples

      iex> change_punch(punch)
      %Ecto.Changeset{data: %Punch{}}

  """
  def change_punch(%Punch{} = punch, attrs \\ %{}) do
    Punch.changeset(punch, attrs)
  end
end
