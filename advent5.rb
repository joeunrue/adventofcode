def parse_crates(input)
  Matrix(input).transpose.to_a
end

def new_crates
  {
    "1"=>["[N]", "[B]", "[D]", "[T]", "[V]", "[G]", "[Z]", "[J]"],
    "2"=>["[S]", "[R]", "[M]", "[D]", "[W]", "[P]", "[F]"],
    "3"=>["[V]", "[C]", "[R]", "[S]", "[Z]"],
    "4"=>["[R]", "[T]", "[J]", "[Z]", "[P]", "[H]", "[G]"],
    "5"=>["[T]", "[C]", "[J]", "[N]", "[D]", "[Z]", "[Q]", "[F]"],
    "6"=>["[N]", "[V]", "[P]", "[W]", "[G]", "[S]", "[F]", "[M]"],
    "7"=>["[G]", "[C]", "[V]", "[B]", "[P]", "[Q]"],
    "8"=>["[Z]", "[B]", "[P]", "[N]"],
    "9"=>["[J]", "[P]", "[J]"]
  }
end

def follow_instruction(instruction)
  puts instruction
  puts @crates.inspect
  split = instruction.split(' ')
  count = split[1].to_i
  from_spot = split[3]
  to_spot = split[5]

  count.times do
    puts from_spot.inspect
    crate = @crates[from_spot].pop
    @crates[to_spot] << crate if crate
  end
end

def follow_instruction_plus(instruction)
  puts instruction
  puts @crates.inspect
  split = instruction.split(' ')
  count = split[1].to_i
  from_spot = split[3]
  to_spot = split[5]

  movers = []
  count.times do
    movers << @crates[from_spot].pop
  end

  movers.compact!

  @crates[to_spot] += movers.reverse
end
