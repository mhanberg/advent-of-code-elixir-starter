defmodule Mix.Tasks.D17.P2 do
  use Mix.Task

  import AdventOfCode2018.Day17

  @shortdoc "Day 17 Part 2"
  def run(_) do
    input = nil

    input
    |> part2() 
    |> IO.inspect(label: "Part 2 Results") 
  end
end   
