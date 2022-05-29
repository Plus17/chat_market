defmodule ChatMarket.Requests do
  @moduledoc """
  The Requests context.
  """

  import Ecto.Query, warn: false
  alias ChatMarket.Repo

  alias ChatMarket.Requests.SwitchRequest

  alias ChatMarket.Block.BlocksUsers

  @doc """
  Returns the list of switch_requests.

  ## Examples

      iex> list_switch_requests()
      [%SwitchRequest{}, ...]

  """
  def list_switch_requests do
    Repo.all(SwitchRequest)
  end

  def create(%BlocksUsers{} = block_user_requester, %BlocksUsers{} = block_user_requested) do
    switch_request_params = %{
      status: :requested,
      requester_id: block_user_requester.user.id,
      requested_id: block_user_requested.user.id,
      blocks_users_requester_id: block_user_requester.id,
      blocks_users_requested_id: block_user_requested.id
    }

    %SwitchRequest{}
    |> SwitchRequest.changeset(switch_request_params)
    |> Repo.insert()
  end

  def get_by_requested_id(requested_id) do
    SwitchRequest
    |> where([request], request.requested_id == ^requested_id)
    |> where([request], request.status == ^:requested)
    |> preload(blocks_users_requester: [:block, :user], blocks_users_requested: [:block])
    |> Repo.all()
  end

  @doc """
  Gets a single switch_request.

  Raises `Ecto.NoResultsError` if the Switch request does not exist.

  ## Examples

      iex> get_switch_request!(123)
      %SwitchRequest{}

      iex> get_switch_request!(456)
      ** (Ecto.NoResultsError)

  """
  def get_switch_request!(id), do: Repo.get!(SwitchRequest, id)

  @doc """
  Creates a switch_request.

  ## Examples

      iex> create_switch_request(%{field: value})
      {:ok, %SwitchRequest{}}

      iex> create_switch_request(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_switch_request(attrs \\ %{}) do
    %SwitchRequest{}
    |> SwitchRequest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a switch_request.

  ## Examples

      iex> update_switch_request(switch_request, %{field: new_value})
      {:ok, %SwitchRequest{}}

      iex> update_switch_request(switch_request, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_switch_request(%SwitchRequest{} = switch_request, attrs) do
    switch_request
    |> SwitchRequest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking switch_request changes.

  ## Examples

      iex> change_switch_request(switch_request)
      %Ecto.Changeset{data: %SwitchRequest{}}

  """
  def change_switch_request(%SwitchRequest{} = switch_request, attrs \\ %{}) do
    SwitchRequest.changeset(switch_request, attrs)
  end
end
