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

{:ok, _block} = ChatMarket.Blocks.create_block(%{start_at: DateTime.utc_now(), end_at: DateTime.utc_now()})
{:ok, _block} = ChatMarket.Blocks.create_block(%{start_at: DateTime.utc_now(), end_at: DateTime.utc_now()})
{:ok, _block} = ChatMarket.Blocks.create_block(%{start_at: DateTime.utc_now(), end_at: DateTime.utc_now()})
{:ok, _block} = ChatMarket.Blocks.create_block(%{start_at: DateTime.utc_now(), end_at: DateTime.utc_now()})
{:ok, _block} = ChatMarket.Blocks.create_block(%{start_at: DateTime.utc_now(), end_at: DateTime.utc_now()})
