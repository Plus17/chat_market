# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ChatMarket.Repo.insert!(%ChatMarket.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


{:ok, user} =  ChatMarket.Contexts.Users.register_user(%{email: "test@test.com", password: "soyunpassword"})

{:ok, block_1} = ChatMarket.Blocks.create_block(%{start_at: DateTime.utc_now(), end_at: DateTime.utc_now()})
{:ok, block_2} = ChatMarket.Blocks.create_block(%{start_at: DateTime.utc_now(), end_at: DateTime.utc_now()})
{:ok, block_3} = ChatMarket.Blocks.create_block(%{start_at: DateTime.utc_now(), end_at: DateTime.utc_now()})
{:ok, block_4} = ChatMarket.Blocks.create_block(%{start_at: DateTime.utc_now(), end_at: DateTime.utc_now()})
{:ok, block_5} = ChatMarket.Blocks.create_block(%{start_at: DateTime.utc_now(), end_at: DateTime.utc_now()})



{:ok, _block_user} = ChatMarket.Contexts.BlocksUsersManager.create(%{block_id: block_1.id, user_id: user.id})
{:ok, _block_user} = ChatMarket.Contexts.BlocksUsersManager.create(%{block_id: block_2.id, user_id: user.id})
{:ok, _block_user} = ChatMarket.Contexts.BlocksUsersManager.create(%{block_id: block_3.id, user_id: user.id})
{:ok, _block_user} = ChatMarket.Contexts.BlocksUsersManager.create(%{block_id: block_4.id, user_id: user.id})
{:ok, _block_user} = ChatMarket.Contexts.BlocksUsersManager.create(%{block_id: block_5.id, user_id: user.id})
