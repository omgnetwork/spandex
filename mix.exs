defmodule Spandex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :spandex,
      version: "2.4.1",
      elixir: "~> 1.3",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      name: "Spandex",
      docs: docs(),
      source_url: "https://github.com/spandex-project/spandex",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls.circle": :test,
        coveralls: :test,
        dialyzer: :test
      ],
      deps: deps(),
      dialyzer: dialyzer()
    ]
  end

  defp description do
    """
    A platform agnostic tracing library. Contributors welcome.
    """
  end

  defp package do
    # These are the default files included in the package
    [
      name: :spandex,
      maintainers: ["Zachary Daniel", "Andrew Summers", "Greg Mefford"],
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/spandex-project/spandex"}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: [
        "README.md"
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:benchee, "~> 0.13.2", only: [:dev, :test]},
      {:credo, "~> 0.9.2", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.19.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:git_ops, "~> 0.3.3", only: :dev},
      {:inch_ex, github: "rrrene/inch_ex", only: [:dev, :test]},
      {:optimal, "~> 0.3.3"},
      {:plug, ">= 1.0.0"},
      {:decorator, "~> 1.2", optional: true}
    ]
  end

  defp dialyzer do
    [
      flags: [:error_handling, :race_conditions, :underspecs, :unknown, :unmatched_returns],
      list_unused_filters: true,
      plt_add_apps: plt_apps()
    ]
  end

  defp plt_apps,
    do: [
      :ex_unit,
      :iex,
      :jason,
      :mix,
      :plug
    ]
end
