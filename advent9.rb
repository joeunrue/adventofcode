def parse_file
  file = File.open('input.txt').read
  file.split("\n")
end

def part1(instructions)
  head = { x: 0, y: 0 }
  tail = { x: 0, y: 0 }
  moved_through = []

  instructions.each do |instruction|
    direction, steps = instruction.split(' ')

    # head moves
    steps.to_i.times do
      case direction
      when 'U'
        head[:y] += 1
      when 'D'
        head[:y] -= 1
      when 'L'
        head[:x] -= 1
      when 'R'
        head[:x] += 1
      end

      follow(head, tail)

      moved_through << tail.to_s
      puts moved_through
    end
  end
  moved_through.uniq
end

def part2(instructions)
  knots = {}
  knots[0] = { x: 0, y: 0 }
  knots[1] = { x: 0, y: 0 }
  knots[2] = { x: 0, y: 0 }
  knots[3] = { x: 0, y: 0 }
  knots[4] = { x: 0, y: 0 }
  knots[5] = { x: 0, y: 0 }
  knots[6] = { x: 0, y: 0 }
  knots[7] = { x: 0, y: 0 }
  knots[8] = { x: 0, y: 0 }
  knots[9] = { x: 0, y: 0 }
  moved_through = []

  instructions.each do |instruction|
    direction, steps = instruction.split(' ')

    # head moves
    steps.to_i.times do
      case direction
      when 'U'
        knots[0][:y] += 1
      when 'D'
        knots[0][:y] -= 1
      when 'L'
        knots[0][:x] -= 1
      when 'R'
        knots[0][:x] += 1
      end

      (knots.count - 1).times do |i|
        follow(knots[i], knots[i + 1])
        print '.'
      end

      moved_through << knots[9].to_s
      puts knots.inspect
    end
  end
  moved_through.uniq.count
end

def follow(head, tail)
  # tail follows
  if head[:x] - tail[:x] >= 2
    tail[:x] += 1
    if head[:y] > tail[:y]
      tail[:y] += 1
    elsif head[:y] < tail[:y]
      tail[:y] -= 1
    end
  elsif tail[:x] - head[:x] >= 2
    tail[:x] -= 1
    if head[:y] > tail[:y]
      tail[:y] += 1
    elsif head[:y] < tail[:y]
      tail[:y] -= 1
    end
  elsif head[:y] - tail[:y] >= 2
    tail[:y] += 1
    if head[:x] > tail[:x]
      tail[:x] += 1
    elsif head[:x] < tail[:x]
      tail[:x] -= 1
    end
  elsif tail[:y] - head[:y] >= 2
    tail[:y] -= 1
    if head[:x] > tail[:x]
      tail[:x] += 1
    elsif head[:x] < tail[:x]
      tail[:x] -= 1
    end
  end
end
