defmodule KinoReq.MixProject do
  use Mix.Project

  def project do
    [
      app: :kino_req,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:kino, "~> 0.4.0"},
      {:req, "~> 0.2.0"}
    ]
  end
end
