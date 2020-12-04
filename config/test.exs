# Don't let CI fetch inputs from the server! Be nice!
# https://www.reddit.com/r/adventofcode/comments/5h6mmt/how_to_read_input/day6jlw
config :advent_of_code, AdventOfCode.Input, allow_network?: false
