defmodule ChatMarketWeb.SwitchRequestController do
  use ChatMarketWeb, :controller

  alias ChatMarket.Block.BlocksUsers

  alias ChatMarket.Contexts.BlocksUsersManager

  alias ChatMarket.Requests.SwitchRequest

  alias ChatMarket.Requests

  def create(conn, %{"block_user_requester" => block_user_requester_id, "block_user_requested_id" => block_user_requested_id} = _params) do
    with %BlocksUsers{} = block_user_requester <- BlocksUsersManager.get(block_user_requester_id),
    %BlocksUsers{} = block_user_requested <- BlocksUsersManager.get(block_user_requested_id),
    {:ok, %SwitchRequest{} = _switch_request} <- Requests.create(block_user_requester, block_user_requested) do
      redirect(conn, to: Routes.available_block_path(conn, :index))
    end
  end

  def update(conn, %{"action_to_perform" => "accept"} = params) do
    params |> IO.inspect(label: "PARAMS")
    with %SwitchRequest{} = switch_request <- Requests.get_switch_request!(params["id"]) |> IO.inspect(label: "GET SWITCH REQUEST"),
      %BlocksUsers{} = block_user_requester <- BlocksUsersManager.get(switch_request.blocks_users_requester_id) |> IO.inspect(label: "GET REQUESTER"),
      %BlocksUsers{} = block_user_requested <- BlocksUsersManager.get(switch_request.blocks_users_requested_id) |> IO.inspect(label: "GET REQUESTED"),
      {:ok, _updated_block_user_requester} <- BlocksUsersManager.update(block_user_requester, %{user_id: block_user_requested.user_id}) |> IO.inspect(label: "UPDATE REQYESTED"),
      {:ok, _updated_block_user_requested} <- BlocksUsersManager.update(block_user_requested, %{user_id: block_user_requester.user_id}) |> IO.inspect(label: "UPDATED REQUESTER"),
      {:ok, _updated_switch_request}  <- Requests.update_switch_request(switch_request, %{status: :accepted}) |> IO.inspect(label: "SWITCH") do
        redirect(conn, to: Routes.block_path(conn, :index))
    end
  end

  def update(conn, %{"action_to_perform" => "reject"} = params) do
    params |> IO.inspect(label: "PARAMS")
    with %SwitchRequest{} = switch_request <- Requests.get_switch_request!(params["id"]) |> IO.inspect(label: "GET REQUEST"),
      {:ok, _updated_switch_request}  <- Requests.update_switch_request(switch_request, %{status: :rejected}) |> IO.inspect(label: "REJECT REQUEST") do
        redirect(conn, to: Routes.block_path(conn, :index)) |> IO.inspect(label: "REDIRECT")
    end
  end
end
