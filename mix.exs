defmodule ExAws.Timestream.MixProject do
  use Mix.Project

  @version "0.5.1"
  @service "timestream"
  @url "https://github.com/ex-aws/ex_aws_#{@service}"
  @name __MODULE__ |> Module.split() |> Enum.take(2) |> Enum.join(".")

  def project do
    [
      app: :ex_aws_timestream,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: @name,
      description: description(),
      package: package(),
      docs: [main: @name, source_ref: "v#{@version}", source_url: @url],
      dialyzer: [
        plt_add_apps: [:ex_unit]
      ]
    ]
  end

  defp description() do
    "Timestream support library for ExAws."
  end

  defp package do
    [
      description: "#{@name} service package",
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Mike Foucault"],
      licenses: ["MIT"],
      links: %{github: @url}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:hackney, ">= 0.0.0", only: [:dev, :test]},
      {:jason, ">= 0.0.0", only: [:dev, :test]},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      ex_aws()
    ]
  end

  defp ex_aws() do
    case System.get_env("AWS") do
      "LOCAL" -> {:ex_aws, path: "../ex_aws"}
      _ -> {:ex_aws, "~> 2.5.0"}
    end
  end
end
