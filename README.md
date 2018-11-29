# Advent of Code Elixir Starter

A batteries included starter pack for participating in [Advent of Code](https://www.adventofcode.com) using Elixir!

## Usage

There are 25 modules, 25 tests, and 50 mix tasks. 

1. Fill in the tests with the example solutions.
1. Write your implementation.
1. Fill in the final problem inputs into the mix task and run `mix d01.p1`!

```elixir
defmodule AdventOfCode2018.Day01 do
  def part1(args) do
  end

  def part2(args) do
  end
end
```

```elixir
defmodule AdventOfCode2018.Day01Test do
  use ExUnit.Case

  import AdventOfCode2018.Day01

  @tag :skip # Make sure to remove to run your test.
  test "part1" do
    input = nil 
    result = part1(input)

    assert result
  end

  @tag :skip # Make sure to remove to run your test.
  test "part2" do
    input = nil 
    result = part2(input)

    assert result
  end
end
```

```elixir
defmodule Mix.Tasks.D01.P1 do
  use Mix.Task

  import AdventOfCode2018.Day01

  @shortdoc "Day 01 Part 1"
  def run(_) do
    input = nil

    input
    |> part1()
    |> IO.inspect(label: "Part 1 Results") 
  end
end   
```

## Installation

```bash
# clone
$ git clone git@github.com:mhanberg/advent-of-code-elixir-starter.git advent-of-code
$ cd advent-of-code

# Reinitialize your git repo
$ rm -rf .git
$ git init
```
