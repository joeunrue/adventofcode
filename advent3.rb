def score_of_all_contents(all_contents)
  results = all_contents.map do |row|
    item = item_in_both(row)
    score_of_item(item)
  end

  results.sum
end

def by_threes(all_contents)
  total_score = 0

  all_contents.each_slice(3) do |slice|
    slice_score = score_of_item(items_in_three(slice))
    puts slice_score
    total_score += slice_score
  end

  total_score
end

def scores
  return @scores if @scores

  @scores = {}
  score = 1
  ('a'..'z').to_a.each do |c|
    @scores[c] = score
    score += 1
  end
  ('A'..'Z').to_a.each do |c|
    @scores[c] = score
    score += 1
  end
end

def score_of_item(item)
  scores[item]
end

def item_in_both(contents)
  count = contents.length / 2
  first_compartment = contents.split('')[0..count-1]
  second_compartment = contents.split('')[count..-1]

  (first_compartment & second_compartment).first
end

def items_in_three(array)
  contents = array.map{|i| i.split('') }

  (contents[0] & contents[1] & contents[2]).first
end
