defmodule Mix.Tasks.D23.P1 do
  use Mix.Task

  import AdventOfCode2018.Day23

  @shortdoc "Day 23 Part 1"
  def run(_) do
    input = nil

    input
    |> part1()
    |> IO.inspect(label: "Part 1 Results") 
  end
end   
