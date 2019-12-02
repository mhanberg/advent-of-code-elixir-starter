for day <- 1..25 do
  for part <- 1..2 do
    Module.create(
      String.to_atom("Elixir.Mix.Tasks.D#{day}.P#{part}"),
      quote do
        use Mix.Task

        import unquote(String.to_atom("Elixir.AdventOfCode.Day#{day}"))

        @shortdoc "Day #{unquote(day)} Part #{unquote(part)}"
        def run(args) do
          input = nil

          if Enum.member?(args, "-b"),
            do:
              %{unquote(String.to_atom("part_#{part}")) => fn -> unquote(String.to_atom("part#{part}"))(input) end}
              |> Benchee.run(),
            else:
              input
              |> unquote(String.to_atom("part#{part}"))()
              |> IO.inspect(label: "Part #{unquote(part)} Results")
          end
        end,
      Macro.Env.location(__ENV__)
    )
  end
end


{:%{}, [], [test: 1]}
