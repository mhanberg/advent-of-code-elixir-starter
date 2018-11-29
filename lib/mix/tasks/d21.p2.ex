defmodule Mix.Tasks.D21.P2 do
  use Mix.Task

  import AdventOfCode2018.Day21

  @shortdoc "Day 21 Part 2"
  def run(_) do
    input = nil

    input
    |> part2() 
    |> IO.inspect(label: "Part 2 Results") 
  end
end   
