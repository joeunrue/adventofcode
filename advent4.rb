def overlap_count(data)
  data.select{|i| overlap(i) }.count
end

def parse_row(row)
  row.split(",").map { |i| i.split('-') }.map { |i| i[0].to_i..i[1].to_i }
end

def overlap(row)
  row = parse_row(row)

  one = row.first.to_a
  two = row.last.to_a

  (one & two).any?
end

def completely_overlap(row)
  row = parse_row(row)

  one = row.first.to_a
  two = row.last.to_a

  one.map { |i| two.include? i }.all? || two.map { |i| one.include? i }.all?
end
