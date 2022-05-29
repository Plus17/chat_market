defmodule ChatMarketWeb.SwitchRequestController do
  use ChatMarketWeb, :controller

  alias ChatMarket.Block.BlocksUsers

  alias ChatMarket.Contexts.BlocksUsersManager

  alias ChatMarket.Requests.SwitchRequest

  alias ChatMarket.Requests

  def create(
        conn,
        %{
          "block_user_requester" => block_user_requester_id,
          "block_user_requested_id" => block_user_requested_id
        } = _params
      ) do
    with %BlocksUsers{} = block_user_requester <- BlocksUsersManager.get(block_user_requester_id),
         %BlocksUsers{} = block_user_requested <- BlocksUsersManager.get(block_user_requested_id),
         {:ok, %SwitchRequest{} = _switch_request} <-
           Requests.create(block_user_requester, block_user_requested) do
      redirect(conn, to: Routes.available_block_path(conn, :index))
    end
  end

  def update(conn, %{"action_to_perform" => "accept"} = params) do
    with %SwitchRequest{} = switch_request <-
           Requests.get_switch_request!(params["id"]),
         %BlocksUsers{} = block_user_requester <-
           BlocksUsersManager.get(switch_request.blocks_users_requester_id),
         %BlocksUsers{} = block_user_requested <-
           BlocksUsersManager.get(switch_request.blocks_users_requested_id),
         {:ok, _updated_block_user_requester} <-
           BlocksUsersManager.update(block_user_requester, %{
             user_id: block_user_requested.user_id
           }),
         {:ok, _updated_block_user_requested} <-
           BlocksUsersManager.update(block_user_requested, %{
             user_id: block_user_requester.user_id
           }),
         {:ok, _updated_switch_request} <-
           Requests.update_switch_request(switch_request, %{status: :accepted}) do
      redirect(conn, to: Routes.block_path(conn, :index))
    end
  end

  def update(conn, %{"action_to_perform" => "reject"} = params) do
    with %SwitchRequest{} = switch_request <-
           Requests.get_switch_request!(params["id"]),
         {:ok, _updated_switch_request} <-
           Requests.update_switch_request(switch_request, %{status: :rejected}) do
      redirect(conn, to: Routes.block_path(conn, :index))
    end
  end
end
