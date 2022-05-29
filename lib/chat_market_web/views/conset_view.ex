defmodule ChatMarketWeb.ConsentView do
  use ChatMarketWeb, :view

  def render("consent.json", _) do
    %{info: "Consent received with success!"}
  end
end
