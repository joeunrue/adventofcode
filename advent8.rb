def count_trees(trees)
  visible = []
  trees.each_with_index do |row, y|
    visible[y] ||= []
    row.each_with_index do |tree, x|
      visible[y][x] = is_visible(trees, y, x)
    end
  end

  visible.flatten.select{|i| i }.count
end

def is_visible(trees, y, x)
  north = false
  south = false
  east = false
  west = false

  if visible_from_north(trees, y, x)
    north = true
  end
  if visible_from_south(trees, y, x)
    south = true
  end
  if visible_from_east(trees, y, x)
    east = true
  end
  if visible_from_west(trees, y, x)
    west = true
  end

  puts "#{y}, #{x} #{north} #{south} #{east} #{west}"

  north || south || east || west
end

def visible_from_north(trees, y, x)
  if y == 0
    true
  else
    (0..(y-1)).map do |i|
      trees[i][x] < trees[y][x]
    end.all?
  end
end

def visible_from_south(trees, y, x)
  count = trees.first.count - 1

  if y == count
    true
  else
    ((y+1)..count).map do |i|
      trees[i][x] < trees[y][x]
    end.all?
  end
end

def visible_from_east(trees, y, x)
  count = trees.first.count - 1

  if x == count
    true
  else
    ((x+1)..count).map do |i|
      trees[y][i] < trees[y][x]
    end.all?
  end
end

def visible_from_west(trees, y, x)
  if x == 0
    true
  else
    (0..(x-1)).map do |i|
      trees[y][i] < trees[y][x]
    end.all?
  end
end

def best_scenic_score(trees)
  scores = []
  trees.each_with_index do |row, y|
    scores[y] ||= []
    row.each_with_index do |tree, x|
      scores[y][x] = scenic_score(trees, y, x)
    end
  end

  scores
end

def scenic_score(trees, y, x)
  north = trees_visible_to_north(trees, y, x)
  south = trees_visible_to_south(trees, y, x)
  east = trees_visible_to_east(trees, y, x)
  west = trees_visible_to_west(trees, y, x)

  puts "#{y}, #{x} #{north} #{south} #{east} #{west}"

  north * south * east * west
end

def trees_visible_to_north(trees, y, x)
  if y == 0
    0
  else
    count = 0
    (0..(y-1)).to_a.reverse.map do |i|
      if trees[i][x] < trees[y][x]
        count += 1
      else
        count += 1
        break
      end
    end
    count
  end
end

def trees_visible_to_south(trees, y, x)
  max = trees.first.count - 1

  if y == max
    0
  else
    count = 0
    ((y+1)..max).map do |i|
      if trees[i][x] < trees[y][x]
        count += 1
      else
        count += 1
        break
      end
    end
    count
  end
end

def trees_visible_to_east(trees, y, x)
  max = trees.first.count - 1

  if x == max
    0
  else
    count = 0
    ((x+1)..max).map do |i|
      if trees[y][i] < trees[y][x]
        count += 1
      else
        count += 1
        break
      end
    end
    count
  end
end

def trees_visible_to_west(trees, y, x)
  if x == 0
    0
  else
    count = 0
    (0..(x-1)).to_a.reverse.map do |i|
      if trees[y][i] < trees[y][x]
        count += 1
      else
        count += 1
        break
      end
    end
    count
  end
end
