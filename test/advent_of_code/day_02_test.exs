defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  describe "part1" do
    # Start coordinate = (0, 0)
    test "Define a tuple for forward instruction: horizontal" do
      input = ["forward 5"]
      result = define_coordinates(input)

      assert result = [{5, 0}]
    end

    test "Define a tuple for down instruction: depth (+)" do
      input = ["down 5"]
      result = define_coordinates(input)

      assert result = [{0, 5}]
    end

    test "Define a tuple for up instruction: depth (-)" do
      input = ["up 5"]
      result = define_coordinates(input)

      assert result = [{0, -5}]
    end

    test "Creates the list of values for horizontal and depth positions" do
      input = ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]
      result = define_coordinates(input)

      assert result = [{5, 0}, {0, 5}, {8, 0}, {0, -3}, {0, 8}, {2, 0}]
    end

    test "It takes a list of coordinates and define the horizontal and depth positions" do
      input = ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]
      result = part1(input)

      assert result = 15
    end
  end

  # @tag :skip
  # test "part2" do
  #   input = nil
  #   result = part2(input)

  #   assert result
  # end
end
